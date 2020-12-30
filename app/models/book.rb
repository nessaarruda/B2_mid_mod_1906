class Book < ApplicationRecord
  has_many :author_books
  has_many :authors, through: :author_books
  validates_presence_of :title, :number_of_pages, :publication_year

  def self.average_number_of_pages
    average(:number_of_pages)
  end
end
