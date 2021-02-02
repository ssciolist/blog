require 'rails_helper'

RSpec.describe "articles index page", type: :feature do
    it "can see all article titles and text snippet" do
        article_1 = Article.create(title: "My first post")
        article_2 = Article.create(title: "Watercolor picture")

        visit root_path

        expect(page).to have_content(article_1.title)
        expect(page).to have_content(article_2.title)
    end
end