class Enrollment < ActiveRecord::Base
  belongs_to :child
  belongs_to :sponsor


  ATTENDANCE_ARRAY = ["yes", "no", "sick",
                      "graduated", "university_sponsored", "university_not_sponsored",
                      "out_of_program", "other"]

  # translator is either a view or controller
  def self.attendance_to_code(translator)
    ATTENDANCE_ARRAY.map{|e| [translator.tr("enrollment_attendance." + e), e]}
  end

  def self.code_to_attendance(translator)
    h = {}
    ATTENDANCE_ARRAY.each{|e| h[e] = translator.tr("enrollment_attendance." + e)}
    h
  end


  GRADES_ARRAY = ["grade1", "grade2", "grade3",
                  "grade4", "grade5", "grade6",
                  "grade7", "grade8", "grade9",
                  "grade10", "grade11", "grade12",
                  "aula_inter"]

  # translator is either a view or controller
  def self.grades_to_code(translator)
    GRADES_ARRAY.map{|e| [translator.tr("enrollment_grades." + e), e]}
  end

  def self.code_to_grades(translator)
    h = {}
    GRADES_ARRAY.each{|e| h[e] = translator.tr("enrollment_grades." + e)}
    h
  end


  SHIRT_SIZE_ARRAY = ["male_4", "male_6", "male_8", "male_10", "male_12",
                      "male_14", "male_16", "male_18",
                      "male_s", "male_m", "male_l",
                      "male_k4", "male_k6", "male_k8", "male_k10", "male_k12",
                      "female_6", "female_8", "female_10", "female_12", "female_14",
                      "female_16", "female_18",
                      "female_m",
                      "female_k4", "female_k6", "female_k8", "female_k10", "female_k12",
                      "other"
                    ]

  # translator is either a view or controller
  def self.shirt_sizes_to_code(translator)
    SHIRT_SIZE_ARRAY.map{|e| [translator.tr("enrollment_shirt_sizes." + e), e]}
  end

  def self.code_to_shirt_sizes(translator)
    h = {}
    SHIRT_SIZE_ARRAY.each{|e| h[e] = translator.tr("enrollment_shirt_sizes." + e)}
    h
  end


  PANT_SIZE_ARRAY =  ["male_2", "male_4", "male_6", "male_8", "male_10", "male_12",
                      "male_14", "male_16", "male_18", "male_26", "male_28", "male_30",
                      "male_32", "male_34", "male_36", "male_38",
                      "male_k4", "male_k6", "male_k8", "male_k10", "male_k12",
                      "female_4", "female_6", "female_8", "female_10", "female_12", "female_14",
                      "female_16", "female_18", "female_xs", "female_s", "female_m", "female_l", "female_xl",
                      "female_k4", "female_k6", "female_k8", "female_k10",
                      "female_k12", "female_k14", "female_k16", "female_k18",
                      "other"
                    ]

  # translator is either a view or controller
  def self.pant_sizes_to_code(translator)
    PANT_SIZE_ARRAY.map{|e| [translator.tr("enrollment_pant_sizes." + e), e]}
  end

  def self.code_to_pant_sizes(translator)
    h = {}
    PANT_SIZE_ARRAY.each{|e| h[e] = translator.tr("enrollment_pant_sizes." + e)}
    h
  end


  SHOE_SIZE_ARRAY =  ["male_24", "male_25", "male_26", "male_27", "male_28", "male_29",
                      "male_30", "male_31", "male_32", "male_33", "male_34", "male_35",
                      "male_36", "male_37", "male_38", "male_39",
                      "male_40", "male_41", "male_42", "male_43", "male_44",
                      "female_24", "female_25", "female_26", "female_27", "female_28", "female_29",
                      "female_30", "female_31", "female_32", "female_33", "female_34", "female_35", "female_36",
                      "female_37", "female_38", "female_39", "female_40",
                      "female_41", "female_42", "female_43", "female_44",
                      "other"
                    ]

  # translator is either a view or controller
  def self.shoe_sizes_to_code(translator)
    SHOE_SIZE_ARRAY.map{|e| [translator.tr("enrollment_shoe_sizes." + e), e]}
  end

  def self.code_to_shoe_sizes(translator)
    h = {}
    SHOE_SIZE_ARRAY.each{|e| h[e] = translator.tr("enrollment_shoe_sizes." + e)}
    h
  end

  def self.load_file(file_name)
    text=File.open(file_name).read
    text.gsub!(/\r\n?/, "\n")
    first = true
    text.each_line do |line|
      begin
      if !first
        cols = line.strip.split("\t")
        child = Child.where(id: cols[1].strip.to_i).first
        sponsor = Sponsor.where(code: cols[3].strip.upcase).first
        r = Enrollment.new({
          id: cols[0].present? ? cols[0].strip.to_i : nil,
          child_id: child.id,
          school_year: cols[2].present? ? cols[2].strip : nil,
          sponsor_id: sponsor.present? ? sponsor.id : nil,
          created_at: Time.now,
          updated_at: Time.now
          })
        r.save
        if !r.errors.blank?
          puts r.errors
        end
      end
      first = false
      rescue
        puts line
      end
    end
    nil
  end

end
