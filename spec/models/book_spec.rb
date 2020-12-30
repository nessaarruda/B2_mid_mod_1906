require 'rails_helper'

describe Book do
  describe "relationships" do
    it { should have_many :author_books}
    it { should have_many(:authors).through(:author_books)}
  end
  describe "validations" do
    it { should validate_presence_of :title}
    it { should validate_presence_of :number_of_pages}
    it { should validate_presence_of :publication_year}
  end
  describe "class methods" do
    it "average_number_of_pages" do
      book_1 = Book.create!(title: "The Perks of Being a Wallflower", number_of_pages: 300, publication_year: 1965)
      book_2 = Book.create!(title: "O Vento Levou", number_of_pages: 200, publication_year: 1945)
      author_1 = Author.create!(name: "Michelle Randolph")
      author_1 = Author.create!(name: "Vanessa Arruda")
      AuthorBook.create!(author_id: author_1.id, book_id: book_1.id)
      AuthorBook.create!(author_id: author_1.id, book_id: book_2.id)

      expect(author_1.books.average_number_of_pages).to eq(250)
    end
  end
end
