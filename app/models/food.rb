class Food < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :name, presence: true, uniqueness: true
end