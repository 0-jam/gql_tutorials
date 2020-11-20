module Types
  class CommentType < Types::BaseObject
    field :id, ID, null: true
    field :post, PostType, null: true
    field :content, String, null: true
  end
end
