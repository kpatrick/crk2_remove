json.array!(@sponsorships) do |sponsorship|
  json.extract! sponsorship, :id, :school_year, :sponsor_id, :sponsor_code, :number_children, :dollar_amount
  json.url sponsorship_url(sponsorship, format: :json)
end
