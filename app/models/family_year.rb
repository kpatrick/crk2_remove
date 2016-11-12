class FamilyYear < ActiveRecord::Base
  belongs_to :family

  validate do |r|
    if FamilyYear.exists?(family_id: r.family_id, school_year: r.school_year)
      r.errors[:base] << I18n.t("errors.duplicate")
    end
  end
end
