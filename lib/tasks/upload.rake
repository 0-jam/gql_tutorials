namespace :deploy do
  desc 'Upload shared config files'
  task :upload do
    on roles(:app) do |_host|
      execute "mkdir -p #{shared_path}/config" if test "[ ! -d #{shared_path}/config ]"
      files = ['config/master.key']
      files.each do |file|
        upload!(file, "#{shared_path}/#{file}")
      end
    end
  end

  before :starting, 'deploy:upload'
  after :finishing, 'deploy:cleanup'
end
