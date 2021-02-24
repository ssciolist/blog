require 'rails_helper'

RSpec.describe "articles index page", type: :feature do
    it "can see all article titles" do
        article_1 = Article.create(title: "My first post")
        article_2 = Article.create(title: "Watercolor picture")

        visit root_path

        expect(page).to have_link(article_1.title, exact: true)
        expect(page).to have_link(article_2.title, exact: true)
    end
end