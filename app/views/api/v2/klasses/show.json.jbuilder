json.(@klass, :id, :name, :section_ids) #to support v1 also
json.sections do
  json.array! @klass.sections, :id, :name
end
