# Change these
server '189.126.106.77', port: 22, roles: [:web, :app, :db], primary: true
set :repo_url, 'git@github.com:vishhnu-dev/asserjufe-website.git'
set :application, 'asserjufe-website'
set :user, 'deploy'
set :puma_threads, [4, 16]
set :puma_workers, 0
# Don't change these unless you know what you're doing
set :pty, true
set :use_sudo, true
set :stage, :production
set :deploy_via, :remote_cache
set :deploy_to, "/home/#{fetch(:user)}/#{fetch(:application)}"
set :puma_bind, "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_state, "#{shared_path}/tmp/pids/puma.state"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.access.log"
set :puma_error_log, "#{release_path}/log/puma.error.log"
set :ssh_options, { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa) }
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true # Change to false when not using ActiveRecord
## Defaults:
# set :scm, :git
# set :branch, :master
# set :format, :pretty
# set :log_level, :debug
# set :keep_releases, 5
## Linked Files & Directories (Default None):
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
set :linked_files, %w{config/database.yml config/secrets.yml config/nginx.conf}
set :linked_dirs, %w{uploads}
namespace :puma do
desc 'Create Directories for Puma Pids and Socket'
task :make_dirs do
on roles(:app) do
execute "mkdir #{shared_path}/tmp/sockets -p"
execute "mkdir #{shared_path}/tmp/pids -p"
end
end
Rake::Task[:restart].clear_actions
desc "Overwritten puma:restart task"
task :restart do
puts "Overwriting puma:restart to ensure that puma is running. Effectively, we are just starting Puma."
puts "A solution to this should be found."
invoke 'puma:stop'
invoke 'puma:start'
end
before 'deploy:starting', 'puma:make_dirs'
end
namespace :deploy do
  after :restart do
    on roles(:web), in: :sequence, wait: 5 do
      within release_path do
         execute :rake, 'feed:users'
      end
    end
  end
end
namespace :deploy do
desc "Make sure local git is in sync with remote."
task :check_revision do
on roles(:app) do
unless `git rev-parse HEAD` == `git rev-parse origin/master`
puts "WARNING: HEAD is not the same as origin/master"
puts "Run `git push` to sync changes."
exit
end
end
end
desc 'Initial Deploy'
task :initial do
on roles(:app) do
before 'deploy:restart', 'puma:start'
invoke 'deploy'
end
end
desc 'Restart application'
task :restart do
on roles(:app), in: :sequence, wait: 5 do
invoke!("puma:restart")
end
end
before :starting, :check_revision
after :finishing, :compile_assets
after :finishing, :cleanup
#after :finishing, :restart
end
# ps aux | grep puma # Get puma pid
# kill -s SIGUSR2 pid # Restart puma
# kill -s SIGTERM pid # Stop puma