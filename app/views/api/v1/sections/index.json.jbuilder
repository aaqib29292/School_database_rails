# json.array! @sections, :id, :name, :student_ids

json.sections @sections do |section|
    json.id section.id
    json.name section.name
    json.student_ids section.student_ids
end
