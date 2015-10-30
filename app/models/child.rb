class Child < ActiveRecord::Base
  belongs_to :family
  before_save :analyze_code

  GENDERS_ARRAY = [["Male | Hombre", "male"], ["Female | Mujer", "female"]]
  GENDERS_MAP = Hash[GENDERS_ARRAY.map{|a| [a[1], a[0]]}]
  STATUSES_ARRAY  = [["In Program", "in_program"],["Out of Program", "out_of_program"],["Graduate", "graduate"]]
  STATUSES_MAP = Hash[STATUSES_ARRAY.map{|a| [a[1], a[0]]}]

  def analyze_code
    self.derived_community = nil
    self.derived_number = nil

    if self.code.present?
      match_data = /^([a-zA-Z]*)([0-9]*)$/.match(self.code)
      if match_data && match_data.size == 3
        Rails.logger.debug "derived_community: #{match_data[1]}, derived_number: #{match_data[2]}"
        self.derived_community = match_data[1]
        self.derived_number = match_data[2].to_i
      end
    else
      self.code = "crk-#{SecureRandom::hex(7)}"
    end
  end
end
