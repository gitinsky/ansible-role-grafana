Eye.application 'carbon' do
  working_dir '/opt/graphite'
  stdall '/var/log/eye/carbon-stdall.log' # stdout,err logs for processes by default
  trigger :flapping, times: 10, within: 1.minute, retry_in: 3.minutes
  check :cpu, every: 10.seconds, below: 100, times: 3 # global check for all processes

  process :carbon do
    pid_file '/var/run/carbon-eye.pid'
    start_command './bin/carbon-cache.py --debug start'

    daemonize true
    start_timeout 10.seconds
    stop_timeout 5.seconds

  end

end
