json.array!(@family_years) do |family_year|
  json.extract! family_year, :id, :community_id, :family_id, :school_year, :picture, :notes
  json.url family_year_url(family_year, format: :json)
end
