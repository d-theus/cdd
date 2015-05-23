namespace :server do
  task :stop do
    on roles :app do
      execute '/sbin/service thin stop'
      execute 'sudo /sbin/service nginx stop'
    end
  end

  task :start do
    on roles :app do
      execute '/sbin/service thin start'
      execute 'sudo /sbin/service nginx start'
    end
  end

  task :restart do
    on roles :app do
      execute '/sbin/service thin restart'
      execute 'sudo /sbin/service nginx restart'
    end
  end

  task :log do
    on roles :app do
      execute "cat #{current_path}/log/production.log"
    end
  end
end
