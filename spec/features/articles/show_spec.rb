require 'rails_helper'

RSpec.describe "articles show page", type: :feature do
    it "can visit parameterized page" do
        article_1 = Article.create(title: "My first post")

        visit root_path
        visit article_path(article_1)
        expect(page).to have_link(article_1.title, exact: true)
        expect(page).to have_link(article_2.title, exact: true)
    end
end