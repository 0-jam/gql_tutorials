load File.expand_path('set_rails_env.rake', __dir__)

namespace :deploy do
  desc 'Runs rake db:create'
  task db_create: [:set_rails_env] do
    on fetch(:migration_servers) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, 'db:create'
        end
      end
    end
  end

  before 'deploy:migrate', 'deploy:db_create'
end
