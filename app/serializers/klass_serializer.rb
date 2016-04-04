class KlassSerializer < ActiveModel::Serializer
  attributes :id, :name, :section_ids
end
