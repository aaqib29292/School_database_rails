# json.array! @klasses, :id, :name, :section_ids

json.klasses @klasses do |klass|
    json.id klass.id
    json.name klass.name
    json.section_ids klass.section_ids
end
