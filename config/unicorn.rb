# worker 数量
worker_processes 3

# 日志位置
stderr_path("/web/2010/logs/unicorn_config_manager_error.log")
stdout_path("/web/2010/logs/unicorn_config_manager.log")

# 加载 超时设置 监听
preload_app true
timeout 30
listen '/web/2010/sockets/unicorn_config_manager.sock', :backlog => 2048

# REE GC
if GC.respond_to?(:copy_on_write_friendly=)
  GC.copy_on_write_friendly = true
end

before_fork do |server, worker|
  old_pid = RAILS_ROOT + '/tmp/pids/unicorn.pid.oldbin'
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # ...
    end
  end
end

after_fork do |server, worker|
  ActiveRecord::Base.establish_connection
  CHIMNEY.client.connect_to_server
end