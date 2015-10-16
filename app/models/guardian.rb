class Guardian < ActiveRecord::Base
  belongs_to :family
  RELATIONSHIPS_ARRAY = [["Mother", 1],
      ["Father", 2],
      ["Step Mother", 3],
      ["Grand Mother", 4],
      ["Older Sibling", 5]]
  RELATIONSHIPS_MAP = Hash[RELATIONSHIPS_ARRAY.map{|a| [a[1], a[0]]}]    
end
