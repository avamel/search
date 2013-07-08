class ToursController < ApplicationController
  before_action :set_tour, only: [:show, :edit, :update, :destroy]

  # GET /tours
  # GET /tours.json
  def search
    #raise params[:dates].inspect
    if params[:search_mod] == '1'
      conditions = []
      search = []
      search << params[:search]
      conditions << search unless params[:search].blank?
      conditions << params[:country_name] if params[:country_name].present?
      conditions << params[:type_name] if params[:type_name].present?
      sphinx = conditions.map { |x| x.map { |f| "\"#{f}\"" }.join(' | ') }.join(' | ')
      @tours = Tour.search sphinx, :sql => {:include => [:countries, :types]},
                           :match_mode => :any, :order => :price,
                           :with => {
                                     :created_at => params[:start]..params[:end] }
    else
      #render :text => sphinx
      @tours = Tour.search_elastic(params)
    end
  end

  def index
    @tours = Tour.all
  end


  # GET /tours/1
  # GET /tours/1.json
  def show
  end

  # GET /tours/new
  def new
    @tour = Tour.new
    3.times { @tour.tourdates.build }
  end

  # GET /tours/1/edit
  def edit
  end

  # POST /tours
  # POST /tours.json
  def create
    @tour = Tour.new(tour_params)

    respond_to do |format|
      if @tour.save
        format.html { redirect_to @tour, notice: 'Tour was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tour }
      else
        format.html { render action: 'new' }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tours/1
  # PATCH/PUT /tours/1.json
  def update
    params[:tour][:country_ids] ||= []
    params[:tour][:type_ids] ||= []

    respond_to do |format|
      if @tour.update(tour_params)
        format.html { redirect_to @tour, notice: 'Tour was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tours/1
  # DELETE /tours/1.json
  def destroy
    @tour.destroy
    respond_to do |format|
      format.html { redirect_to tours_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_tour
    @tour = Tour.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def tour_params
    params.require(:tour).permit(:title, :description, :price, :country_ids => [], :type_ids => [], tourdates_attributes: [:id, :startdate, :_destroy])
  end
end
