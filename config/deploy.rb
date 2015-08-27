set :application, 'harmox-analytics'
set :repo_url, 'git@bitbucket.org:snsnwanko/harmox-analytics.git'
set :deploy_to, '/var/www/harmox/analytics'
set :log_level, :debug
set :scm, :git
set :branch, 'master'
set :repository, "."

set :format, :pretty
# set :pty, true

# set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

set :ssh_options, {
  keys: [File.expand_path('~/workspace/private/key/admin.pem')],
  forward_agent: true,
  auth_methods: %w(publickey)
}

# set :default_env, { rbenv_bin_path: '~/.anyenv/envs/rbenv/bin' }
# set :rvm_ruby_version, 'ruby-2.2.1'
set :keep_releases, 3

namespace :deploy do
  after :publishing, :restart

  desc 'Restart application'
  task :restart do
    # application = fetch :application
    # execute "cd #{application}; git pull"
    invoke 'unicorn:restart'
    # on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
  end

  # after :restart, :clear_cache do
  #   on roles(:web), in: :groups, limit: 3, wait: 10 do
  #     # Here we can do anything such as:
  #     # within release_path do
  #     #   execute :rake, 'cache:clear'
  #     # end
  #   end
  # end

  after :finishing, 'deploy:cleanup'

end
