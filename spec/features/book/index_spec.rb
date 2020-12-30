require 'rails_helper'

describe Book do
  describe "As a visitor" do
    describe "When I visit the index page" do
      before :each do
        @book_1 = create(:book)
        @book_2 = create(:book)
        @book_3 = create(:book)
        @author_1 = create(:author)
        @author_2 = create(:author)
        @author_3 = create(:author)
        AuthorBook.create(author_id: @author_1.id, book_id: @book_1.id)
        AuthorBook.create(author_id: @author_1.id, book_id: @book_2.id)
        AuthorBook.create(author_id: @author_1.id, book_id: @book_3.id)
        AuthorBook.create(author_id: @author_2.id, book_id: @book_1.id)
        AuthorBook.create(author_id: @author_3.id, book_id: @book_1.id)
        visit books_path
      end
      it "Shows all books, its attributes and author" do

        expect(page).to have_content(@book_1.title)
        expect(page).to have_content(@book_1.number_of_pages)
        expect(page).to have_content(@book_1.publication_year)
        expect(page).to have_content(@author_1.name)
        expect(page).to have_content(@author_2.name)
        expect(page).to have_content(@author_3.name)
      end
    end
    describe "Author link" do
      it "Shows authors with link to its show page" do
        book_1 = Book.create!(title: "The Perks of Being a Wallflower", number_of_pages: 300, publication_year: 1965)
        book_2 = Book.create!(title: "O Vento Levou", number_of_pages: 200, publication_year: 1945)
        author_1 = Author.create!(name: "Michelle Randolph")
        AuthorBook.create!(author_id: author_1.id, book_id: book_1.id)
        AuthorBook.create!(author_id: author_1.id, book_id: book_2.id)
        visit "/books"

        expect(page).to have_link(author_1.name)

        first("#authors").click_link(author_1.name)

        expect(current_path).to eq("/authors/#{author_1.id}")
        expect(page).to have_content(author_1.name)
        expect(page).to have_content(book_1.title)
        expect(page).to have_content(book_2.title)
        expect(author_1.books.average_number_of_pages).to eq(250)
      end
    end
  end
end
