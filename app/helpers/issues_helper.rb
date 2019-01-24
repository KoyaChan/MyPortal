require 'uri'

module IssuesHelper
  def logfile_path_for(issue)
    Settings.default_path.logfile_path + '\\' + issue.number.to_s
  end

  def latest_todo(issue)
    todo = issue.todos.max_by(&:updated_at)
    return Todo.new(updated_at: Time.zone.at(0)) if todo.nil?
    todo
  end
end
