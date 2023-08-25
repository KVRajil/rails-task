class Fibonacci < ApplicationRecord

  validates :value, :result, :runtime, presence: true
  validates :value, :result, numericality: { only_integer: true }
  validates :runtime, numericality: true

  scope :recent, -> { order(created_at: :desc) }
end
