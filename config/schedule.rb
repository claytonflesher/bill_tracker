# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever


job_type :rake,  "cd :path && /usr/local/bin/chruby-exec ruby-2.2.3 -- bin/rake -e :environment ':task' :output"
set :job_template, "bash -l -i -c ':job'"

every 10.minutes do
  rake "bill_status:email_updates"
end
