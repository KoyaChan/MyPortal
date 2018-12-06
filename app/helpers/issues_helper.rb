require 'uri'

module IssuesHelper
  def logfile_path_for(issue)
    Settings.default_path.logfile_path + '\\' + issue.number.to_s
  end
end
