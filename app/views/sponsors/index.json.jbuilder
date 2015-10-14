json.array!(@sponsors) do |sponsor|
  json.extract! sponsor, :id, :code, :donor_number, :given_name, :family_name, :link, :street_address, :city, :postal_code, :primary_email, :secondary_email, :primary_phone, :secondary_phone
  json.url sponsor_url(sponsor, format: :json)
end