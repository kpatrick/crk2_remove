class Guardian < ActiveRecord::Base
  belongs_to :family
  RELATIONSHIPS_ARRAY = [["Mother", "mother"],
      ["Father", "father"],
      ["Step Mother", "step_mother"],
      ["Grand Mother", "grand_mother"],
      ["Older Sibling", "older_sibling"]]
  RELATIONSHIPS_MAP = Hash[RELATIONSHIPS_ARRAY.map{|a| [a[1], a[0]]}]
end
