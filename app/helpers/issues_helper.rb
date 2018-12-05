require 'uri'

module IssuesHelper
  include ApplicationHelper
  def logfile_path_for(issue)
    'file://' + LOGFILE_ROOT + '\\' + issue.number.to_s
  end
end
