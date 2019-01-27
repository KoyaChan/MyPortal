class Issue < ApplicationRecord
  include IssuesHelper

  has_many  :todos

  validates :number, presence:     true,
                     numericality: { only_integer: true, greater_than: 20_000, less_than: 100_000_000 },
                     uniqueness: true

  validates :subject, presence: true

  before_validation :apply_logpath

  class << self
    def sorted_all
      select { |issue| !issue.archived }
        .sort_by { |issue| issue.latest_todo.updated_at }
        .reverse
    end
  end

  def apply_logpath
    self.logpath = logfile_path_for(self) if logpath.empty?
  end

  def latest_todo
    todo = todos.max_by(&:updated_at)
    return Todo.new(updated_at: Time.zone.at(0)) if todo.nil?
    todo
  end

  def all_todos_sorted
    todos.reject { |todo| todo.id.nil? }
         .sort_by(&:updated_at)
         .reverse
  end
end
