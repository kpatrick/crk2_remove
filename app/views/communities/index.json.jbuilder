json.array!(@communities) do |community|
  json.extract! community, :id, :code, :name
  json.url community_url(community, format: :json)
end
