Eye.application 'gunicorn' do
  working_dir '/opt/graphite/webapp/graphite'
  stdall '/var/log/eye/gunicorn-stdall.log' # stdout,err logs for processes by default
  trigger :flapping, times: 10, within: 1.minute, retry_in: 3.minutes
  check :cpu, every: 10.seconds, below: 100, times: 3 # global check for all processes

  process :gunicorn do
    pid_file '/var/run/gunicorn-eye.pid'
    start_command 'gunicorn_django --bind=0.0.0.0:{{ graphite_http_port }}'

    daemonize true
    start_timeout 10.seconds
    stop_timeout 5.seconds

  end

end
