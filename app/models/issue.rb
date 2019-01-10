class Issue < ApplicationRecord
  has_many  :todos

  validates :number, presence:     true,
                     numericality: { only_integer: true, greater_than: 20_000, less_than: 100_000_000 },
                     uniqueness: true

  validates :subject, presence: true
end
