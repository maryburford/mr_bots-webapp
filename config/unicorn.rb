working_directory File.expand_path("../..", __FILE__)
worker_processes 5
listen "/tmp/unicorn.sock"
timeout 30
pid "/tmp/unicorn_mr_bots-webapp.pid"
stdout_path "/home/ubuntu/mr_bots-webapp/log/unicorn.log"
stderr_path "/home/ubuntu/mr_bots-webapp/log/unicorn.log"
