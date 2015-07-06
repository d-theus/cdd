namespace :assets do
  task :clobber do
    on roles :app do
      within current_path do
        with rails_env: :production, path: '$PATH:/home/web/.rbenv/bin' do
          rake 'assets:clobber'
        end
      end
    end
  end
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

Rake::Task['deploy:assets:precompile'].clear_actions
before 'assets:generators', 'assets:clobber'
before 'deploy:compile_assets', 'assets:generators'

