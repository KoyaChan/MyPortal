class Issue < ApplicationRecord
  validates :number, presence:     true,
                     numericality: { only_integer: true, greater_than: 20_000, less_than: 100_000_000 }

  validates :subject, presence: true
end
