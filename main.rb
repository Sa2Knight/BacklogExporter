require 'backlog_kit'
require 'pp'

API_KEY = ENV['BACKLOGAPI']
SPACE   = ENV['BACKLOG_SPACE']

backlog = BacklogKit::Client.new(space_id: SPACE, api_key: API_KEY)

pp backlog.get_issues.body.first.attributes
