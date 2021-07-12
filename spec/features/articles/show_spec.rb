require 'rails_helper'

RSpec.describe "articles show page", type: :feature do
    it "can visit show page with slug" do
        article_1 = Article.create(title: "My first post", body: "A long diatribe")

        visit root_path
        visit article_path(article_1)

        slug_title = article_1.title.downcase.gsub(" ", "-")
        expect(page).to have_current_path("/articles/#{slug_title}")

        expect(page).to have_content(article_1.title)        
        expect(page).to have_content(article_1.body.body.to_html)        
    end
end