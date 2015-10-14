json.array!(@enrollments) do |enrollment|
  json.extract! enrollment, :id, :school_year, :child_id, :child_code, :sponsor_id, :sponsor_code, :newyear_shirt_size, :newyear_pant_size, :newyear_shoe_size, :midyear_shirt_size, :midyear_pant_size, :midyear_shoe_size, :newyear_attendance_id, :newyear_attendance_notes, :midyear_attendance_id, :midyear_attendance_notes, :report_card, :report_notes, :work_form, :work_form_notes, :pass, :pass_notes, :grades, :grades_notes, :letter, :not_included
  json.url enrollment_url(enrollment, format: :json)
end