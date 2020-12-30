AuthorBook.destroy_all
Author.destroy_all
Book.destroy_all

@book_1 = Book.create!(title: "The Perks of Being a Wallflower", number_of_pages: 300, publication_year: 1965)
@author_1 = Author.create!(name: "Michelle Randolph")
@book_2 = Book.create!(title: "O Vento Levou", number_of_pages: 200, publication_year: 1945)
@author_2 = Author.create!(name: "Vanessa Arruda")

AuthorBook.create!(author_id: @author_1.id, book_id: @book_1.id)
AuthorBook.create!(author_id: @author_2.id, book_id: @book_2.id)
AuthorBook.create!(author_id: @author_2.id, book_id: @book_1.id)
AuthorBook.create!(author_id: @author_1.id, book_id: @book_2.id)
