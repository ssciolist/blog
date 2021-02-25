require 'rails_helper'

RSpec.describe 'Create article from index' do
    it 'a registered User' do
        it 'can create an article with a title' do
            sole_user = User.create(username: 'MeganArellano', password: 'MyPassword')
            allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(sole_user)

            visit root_path
            click_on 'Create new article'

            expect(current_path).to eq('/articles/new')

            fill_in 'Title', with: 'My second post'

            click_on 'Create post'

            expect(current_path).to eq('/articles/my-second-post')
        end
    end

    it 'a visitor' do
        it 'will not see any link to create an article on root page' do
            visit root_path

            expect(page).not_to have_link('Create new article')
        end

        it 'can not visit create an article directly' do
            visit '/articles/new'

            expect(page).to have_content("The page you were looking for doesn't exist")
        end
    end
end