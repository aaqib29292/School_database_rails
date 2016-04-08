# json.array! @students, :id, :name, :fathers_name, :gender, :email, :address, :phone, :dob, :house_id

json.sections @students do |student|
    json.id student.id
    json.name student.name
    json.fathers_name student.fathers_name
    json.gender student.gender
    json.email student.email
    json.address student.address
    json.phone student.phone
    json.dob student.dob
    json.house_id student.house_id
end
