working_directory "/var/www/harmox/analytics/current"
pid "/var/www/harmox/analytics/current/tmp/pids/unicorn.pid"
stderr_path "/var/www/harmox/analytics/current/log/unicorn.log"
stdout_path "/var/www/harmox/analytics/current/log/unicorn.log"

# listen "/tmp/unicorn.todo.sock"
#listen 3000
listen "/var/www/harmox/analytics/shared/tmp/sockets/unicorn.sock"
worker_processes 2
timeout 30
