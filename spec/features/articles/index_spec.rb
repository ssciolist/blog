require 'rails_helper'

RSpec.describe "A visitor", type: :feature do
    it "can see all articles, including body and images" do
        article_1 = Article.create(title: "My first post", body:"I've been waiting")
        article_2 = Article.create(title: "Watercolor picture")

        visit root_path

        expect(page).to have_link(article_1.title, exact: true)
        expect(page).to have_content(article_1.body.body.to_html)
        expect(page).to have_link(article_2.title, exact: true)
    end
end