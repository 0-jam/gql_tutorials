module Types
  class PostType < Types::BaseObject
    description 'A blog post'

    field :id, ID, null: false
    field :title, String, null: true
    field :rating, Integer, null: true
    field :comments, [Types::CommentType], null: true
  end
end
