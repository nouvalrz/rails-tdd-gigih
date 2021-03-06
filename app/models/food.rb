class Food < ApplicationRecord

  belongs_to :category
  
  validates :description, presence: true

  validates :category_id, presence: true

  validate :less_than_two_words

  validates :name, presence: true, uniqueness: true

  validates :price, numericality: true, comparison: { greater_than_or_equal_to: 0.01 }

  def self.by_letter(letter)
    where("name LIKE ?", "#{letter}%").order(:name)
  end

  def less_than_two_words
    if name.split.size < 2
      errors.add(:name, 'needs to be more than 1 word')
    end if name
  end
end