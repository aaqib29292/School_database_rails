# json.array! @students, :id, :name, :fathers_name, :gender, :email, :address, :phone, :dob, :house_id

json.students @students do |student|
    json.klass_id student.section.klass_id
    json.section_id student.section_id
    json.id student.id
    json.name student.name
    json.fathers_name student.fathers_name
    json.gender Student::Gender.label(student.gender)
    json.email student.email
    json.address student.address
    json.phone student.phone
    json.dob student.dob
    json.houseName student.house.name
    json.roll_number student.roll_number
end
