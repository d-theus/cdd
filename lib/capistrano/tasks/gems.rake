namespace :gems do

  def fetch_repo(repo_name)
    within "shared/vendor/package/" do
      if Dir.exists? repo_name
        execute "git pull origin master"
      else
        execute "git clone https://github.com/d-theus/#{repo_name} #{deploy_to}/shared/vendor/package/#{repo_name}"
      end
    end
  end

  desc 'Update WIP gems'
  task :update do
    on roles(:app) do
      within "#{deploy_to}" do
        execute :mkdir, '-p', 'shared/vendor/package'
        fetch_repo('more-responsive-less-ui')
      end
    end
  end
end
