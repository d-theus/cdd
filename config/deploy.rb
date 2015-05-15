# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'cdd'
set :repo_url, 'https://github.com/d-theus/cdd.git'

# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

set :linked_dirs, fetch(:linked_dirs, []).push('vendor/package')

set :default_env, {
  path: '/usr/share/rbenv/shims:$PATH'
}
set :rails_env, 'production'

namespace :deploy do
end
