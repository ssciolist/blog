require 'rails_helper'

RSpec.describe 'Create article from index:' do
    context 'A registered user' do
        include_context 'registered_user'

        it 'can create an article with a title' do
            visit root_path
            click_on 'Create new article'

            expect(current_path).to eq(new_article_path)

            fill_in 'Title', with: 'My second post'
            click_on 'Create article'

            expect(current_path).to eq('/articles/my-second-post')
        end

        it 'can not create an article without a title' do
            visit new_article_path

            click_on 'Create article'

            expect(page).to have_content("Title can't be blank")
        end
    end

    describe 'A visitor' do
        it 'will not see link to create an article on root page' do
            visit root_path

            expect(page).not_to have_link('Create new article')
        end

        it 'can not visit link to create an article directly' do
            visit new_article_path

            expect(page).to have_content("The page you were looking for doesn't exist")
        end
    end
end