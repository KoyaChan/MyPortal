require 'uri'

module IssuesHelper
  def logfile_path_for(issue)
    Settings.default_path.logfile_path + '\\' + issue.number.to_s
  end

  def latest_todo(issue)
    issue.todos.max_by(&:updated_at)
  end
end
