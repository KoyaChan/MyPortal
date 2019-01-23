class Issue < ApplicationRecord
  include IssuesHelper

  has_many  :todos

  validates :number, presence:     true,
                     numericality: { only_integer: true, greater_than: 20_000, less_than: 100_000_000 },
                     uniqueness: true

  validates :subject, presence: true

  before_validation :apply_logpath

  def apply_logpath
    self.logpath = logfile_path_for(self) if logpath.empty?
  end
end
