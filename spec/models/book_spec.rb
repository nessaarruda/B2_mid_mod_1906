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
end
