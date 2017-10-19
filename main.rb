require 'backlog_kit'
require 'csv'

API_KEY = ENV['BACKLOGAPI']
SPACE   = ENV['BACKLOG_SPACE']

backlog = BacklogKit::Client.new(space_id: SPACE, api_key: API_KEY)
offset  = 0

while true
  issues = backlog.get_issues(count: 100, offset: offset).body.map {|i| [i.issueKey, i.summary]}
  break if issues.empty?
  issues.each {|i| puts i.to_csv}
  offset += issues.length
  sleep 1
end
