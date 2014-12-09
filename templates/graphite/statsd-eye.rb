Eye.application 'statsd' do
  working_dir '/home/statsd'
  stdall '/var/log/eye/statsd-stdall.log' # stdout,err logs for processes by default
  trigger :flapping, times: 10, within: 1.minute, retry_in: 3.minutes
  check :cpu, every: 10.seconds, below: 100, times: 3 # global check for all processes

  process :statsd do
    pid_file '/var/run/statsd-eye.pid'
    start_command '/usr/local/bin/statsd'

    daemonize true
    start_timeout 10.seconds
    stop_timeout 5.seconds

  end

end
