class Child < ActiveRecord::Base
  belongs_to :family
  GENDERS_ARRAY = [["Male", "male"], ["Female", "female"]]
  GENDERS_MAP = Hash[GENDERS_ARRAY.map{|a| [a[1], a[0]]}]
  STATUSES_ARRAY  = [["In Program", "in_program"],["Out of Program", "out_of_program"],["Graduate", "graduate"]]
  STATUSES_MAP = Hash[STATUSES_ARRAY.map{|a| [a[1], a[0]]}]
end
