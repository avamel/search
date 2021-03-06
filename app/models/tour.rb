class Tour < ActiveRecord::Base
  include Tire::Model::Search
  include Tire::Model::Callbacks

  has_many :tourdates, dependent: :destroy
  has_and_belongs_to_many :countries
  has_and_belongs_to_many :types
  accepts_nested_attributes_for :tourdates, :allow_destroy => true, reject_if:  :all_blank





  mapping do
    indexes :title
    indexes :description
    indexes :price, type: 'integer'
    indexes :dates, :as => 'tourdates.pluck(:startdate)', type: 'date', :index => :not_analyzed
    indexes :country_name, :as => 'countries.pluck(:name)', :type => :string, :index => :not_analyzed
    indexes :type_name, :as => 'types.pluck(:name)', :type => :string, :index => :not_analyzed
  end

  def self.search_elastic(params)
    tire.search(page: params[:page], per_page: 1000, load: true) do
      query do
        boolean do
          should { string params[:search], default_operator: "OR" } if params[:search].present?
          should { terms :country_name, params[:country_name] } if params[:country_name].present?
          should { terms :type_name, params[:type_name] } if params[:type_name].present?
          should { range :dates, from: params[:start], to: params[:end]} if params[:start].present? && params[:end].present?
          should { range :price, from: params[:min].to_i, to: params[:max].to_i} if params[:min].present? && params[:max].present?
        end
      end
      sort { by :price, "asc" }
    end
  end

  def self.search_sphinx(params)
    conditions = []
    search = []
    search << params[:search]
    @price = Tour.all(:conditions => ["price >= ? AND price <= ?", params[:min], params[:max]])
    @date =  Tourdate.all(:conditions => ["startdate >= ? AND startdate <= ?", params[:start], params[:end]])
    price = []
    date = []
    @price.each do |f|
      price << f.price
    end
    @date.each do |f|
      date << f.startdate
    end
    #render :text => date
    conditions << search unless params[:search].blank?
    conditions << price if price.present?
    conditions << date if date.present?
    conditions << params[:country_name] if params[:country_name].present?
    conditions << params[:type_name] if params[:type_name].present?
    sphinx = conditions.map { |x| x.map { |f| "\"#{f}\"" }.join(' | ') }.join(' | ')

    ThinkingSphinx::Search.new  sphinx,:sql => {:include => [:countries, :types]},
                          :match_mode => :extended, :order => :price
  end


end
