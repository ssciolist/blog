require 'rails_helper'

RSpec.describe "articles show page", type: :feature do
    it "can visit parameterized page" do
        article_1 = Article.create(title: "My first post")

        visit root_path
        visit article_path(article_1)

        parameterized_title = article_1.title.downcase.gsub(" ", "-")
        expect(page).to have_current_path("/articles/#{parameterized_title}")
    end
end