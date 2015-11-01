class Child < ActiveRecord::Base
  belongs_to :family
  before_save :analyze_code

  GENDERS_ARRAY = [["Male (Hombre)", "male"], ["Female (Mujer)", "female"]]
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

  def self.load_file(file_name)
    text=File.open(file_name).read
    text.gsub!(/\r\n?/, "\n")
    first = true
    text.each_line do |line|
      if !first
        cols = line.split("\t")
        f = Family.where(id: cols[2].to_i).first
        c = Child.new({id: cols[0].to_i,
          code: cols[1].present? ? cols[1] : nil,
          family_id: f ? f.id : nil,
          given_name1: cols[3].present? ? cols[3] : nil,
          given_name2: cols[4].present? ? cols[4] : nil,
          family_name1: cols[5].present? ? cols[5] : nil,
          family_name2: cols[6].present? ? cols[6] : nil,
          preferred_name: cols[7].present? ? cols[7] : nil,
          dob: cols[8].present? ? cols[8] : nil,
          status: cols[9] == "1" ? "in_program" : nil,
          gender: cols[10] == "M" ? "male" : nil,
          notes: cols[11].present? ? cols[11] : nil
          })
        c.save
        if !c.errors.blank?
          puts c.errors
        end
      end
      first = false
    end
    nil
  end
end
