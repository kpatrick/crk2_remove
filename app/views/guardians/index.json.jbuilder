json.array!(@guardians) do |guardian|
  json.extract! guardian, :id, :family_id, :relationship, :relationship_id, :active, :primary, :given_name1, :given_name2, :family_name1, :family_name2, :preferred_name, :primary_phone, :secondary_phone
  json.url guardian_url(guardian, format: :json)
end
