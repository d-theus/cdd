# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'cdd'
set :repo_url, 'https://github.com/d-theus/cdd.git'

# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

set :linked_dirs, fetch(:linked_dirs, []).push('vendor/package')

set :default_env, {
  path: '/usr/bin:/bin:/usr/share/rbenv/shims:$PATH'
}
set :rails_env, 'production'
set :rbenv_custom_path, '/usr/share/rbenv'
set :rbenv_type, :user
set :rbenv_ruby, '2.2.0'
set :rbenv_prefix, "RBENV_ROOT=/usr/share/rbenv PATH=$PATH:/usr/share/rbenv/shims"
set :rbenv_map_bins, %w(rake gem bundle ruby rails)
set :rbenv_roles, :all

namespace :deploy do
end
