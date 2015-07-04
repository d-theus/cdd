namespace :assets do
  task :generators do
    on roles :app do
      within current_path do
        with rails_env: :production, path: '$PATH:/home/web/.rbenv/bin' do
          execute :rbenv, :exec, 'rails generate ace_vimtura:install'
        end
      end
    end
  end
end

before 'deploy:compile_assets', 'assets:generators'

