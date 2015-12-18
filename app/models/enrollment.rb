class Enrollment < ActiveRecord::Base
  belongs_to :child

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
