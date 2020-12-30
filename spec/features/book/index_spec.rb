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
        visit "/books"
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
  end
end
