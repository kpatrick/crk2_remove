json.array!(@children) do |child|
  json.extract! child, :id, :code, :family_id, :notes, :given_name1, :given_name2, :family_name1, :family_name2, :preferred_name, :dob, :status, :gender
  json.url child_url(child, format: :json)
end
