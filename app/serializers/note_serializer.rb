class NoteSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :owner, :icon, :user_id, :helpful, :unhelpful
end
