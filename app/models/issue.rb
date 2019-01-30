class Issue < ApplicationRecord
  include IssuesHelper

  has_many  :todos

  validates :number, presence:     true,
                     numericality: { only_integer: true, greater_than: 20_000, less_than: 100_000_000 },
                     uniqueness: true

  validates :subject, presence: true

  before_validation :apply_logpath, :apply_memopath

  class << self
    def sorted_all
      select { |issue| !issue.archived }
        .sort_by { |issue| issue.latest_todo.updated_at }
        .reverse
    end
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

  private

  def apply_logpath
    if logpath.nil? || logpath.empty?
      self.logpath = Settings.default_path.logfile_path + '\\' + number.to_s
    end
    self.logpath = add_prefix(logpath)
  end

  def apply_memopath
    if memopath.nil? || memopath.empty?
      filename = "SF#{number} #{subject}.md"
      self.memopath = Settings.default_path.memo_path + '\\' + filename
    end
    self.memopath = add_prefix(memopath)
  end

  def add_prefix(path)
    prefix = 'File://'
    return path if path =~ /#{prefix}/
    prefix + path
  end
end
