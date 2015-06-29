namespace :sitemap do
  task :create do
    on roles :app do
        within current_path do
          with rails_env: :production do
            rake "sitemap:install"
            rake "sitemap:create"
            create_robots_file
          end
        end
    end
  end
end

def create_robots_file
  within "./public" do
    File.open('robots.txt', 'w') do |f|
      f.puts "Sitemap: http://caffeinedrivendevel.su/sitemap.xml.gz"
    end
  end
end
