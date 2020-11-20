module Mutations
  class CreatePost < Mutations::BaseMutation
    null true

    argument :title, String, required: true

    field :post, Types::PostType, null: true
    field :errors, [String], null: false

    def resolve(title:)
      post = Post.create!(title: title)

      {
        post: post,
        errors: [],
      }
    rescue StandardError
      # Failed save, return the errors to the client
      {
        post: nil,
        errors: post.errors.full_messages,
      }
    end
  end
end
