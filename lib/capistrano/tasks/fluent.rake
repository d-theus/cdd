namespace :fluent do
  task :stop do
    on roles :app do
      execute '/sbin/service fluentd stop'
    end
  end

  task :start do
    on roles :app do
      execute 'sudo /sbin/service fluentd start'
    end
  end

  task :restart do
    on roles :app do
      execute '/sbin/service fluentd restart'
    end
  end
end
