json.array! @klasses do |klass|
  json.id klass.id
  json.name klass.name
  json.section_ids klass.section_ids # to support v1 also
  json.sections do
    json.array! klass.sections, :id, :name
  end
end
