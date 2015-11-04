class Guardian < ActiveRecord::Base
  belongs_to :family
  RELATIONSHIPS_ARRAY = [
      ["Mother", "mother"],
      ["Father", "father"],
      ["Step Mother", "step_mother"],
      ["Step Father", "step_father"],
      ["Grand Mother", "grand_mother"],
      ["Grand Father", "grand_father"],
      ["Older Sibling", "older_sibling"],
      ["Other", "other"]
      ]
  RELATIONSHIPS_MAP = Hash[RELATIONSHIPS_ARRAY.map{|a| [a[1], a[0]]}]
end
