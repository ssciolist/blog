require 'rails_helper'

RSpec.describe 'A visitor' do
    it 'can visit published article with slug url' do
        article_1 = Article.create(
            title: 'My first post',
            body: 'A long diatribe',
            published: true
        )

        visit article_path(article_1)

        slug_title = article_1.title.downcase.gsub(' ', '-')
        expect(page).to have_current_path("/articles/#{slug_title}")
        expect(page).to have_content(article_1.title)        
        expect(page).to have_content(article_1.body.body.to_html)        
    end

    it 'cannot visit an unpublished article' do
        unpubbed_article = Article.create(title: 'Nothing yet')

        visit article_path(unpubbed_article)

        expect(page).to have_content("The page you were looking for doesn't exist")
    end
end