require 'rails_helper'

RSpec.describe 'Create article from index', focus: :true do
    it 'a registered User' do
        it 'can create an article with a title' do
            sole_user = User.create(username: 'MeganArellano', password: 'MyPassword')

            visit '/admin'

            fill_in 'user[username]', with sole_user.username
            fill_in 'user[password]', with sole_user.password
            click_on 'Login'
            
            expect(current_path).to eq(root_path)
            click_on 'Create new article'

            expect(current_path).to eq('/articles/new')

            fill_in 'Title', with: 'My second post'

            click_on 'Create post'

            expect(current_path).to eq('/articles/my-second-post')
        end
    end

    it 'a visitor on the root page' do
        it 'will not see any link to create a post' do
            visit root_path

            expect(page).not_to have_link('Create new article')
        end
    end
end