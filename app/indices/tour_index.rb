ThinkingSphinx::Index.define :tour, :with => :active_record do
  indexes title
  indexes description
  indexes price, :sortable => true
  indexes countries.name, :as => :country_name
  indexes types.name, :as => :type_name
  indexes tourdates.startdate, :as => :dates
  has created_at
end