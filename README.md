# GraphQL tutorials

[Official "Getting Started" page](https://graphql-ruby.org/getting_started.html)

---

1. [Environment](#environment)
1. [Deploying](#deploying)
1. [Query Example](#query-example)
  1. [Searching posts by ID](#searching-posts-by-id)

---

## Environment

- Ubuntu 20.04 on WSL 2
- Ruby 2.7.2 from rbenv
- Rails 6.0.3
- PostgreSQL 12.5

## Deploying

After setting up your server, run this command to deploy

`DEPLOY_TO=<ip address or hostname> SSH_KEY_PATH=<your SSH secret key> DEPLOY_USER_NAME=<username in the server> bx cap production deploy`

## Query Example

All query strings are available after `$ bundle exec rails db:seed`

### Searching posts by ID

```ruby
irb(main):001:0> qstring = '{post(id: 1) {id title rating}}'
=> "{post(id: 1) {id title rating}}"
irb(main):002:0> result_hash = GqlTutorialsSchema.execute(qstring)
  Post Load (0.7ms)  SELECT "posts".* FROM "posts" WHERE "posts"."id" = $1 LIMIT $2  [["id", 1], ["LIMIT", 1]]
=> #<GraphQL::Query::Result @query=... @to_h={"data"=>{"post"=>{"id"=>"1", "title"=>"post1", "rating"=>4}}}>
```
