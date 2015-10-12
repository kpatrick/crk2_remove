json.array!(@families) do |family|
  json.extract! family, :id, :community_id, :community_code, :notes
  json.url family_url(family, format: :json)
end
