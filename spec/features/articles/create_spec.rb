require 'rails_helper'

Rspec.describe 'Create article from index', type: :feature do
    it 'can create an article with a title' do
        visit root_path
        click_link 'New article'
        
        expect(current_path).to eq('/articles/new')

        fill_in 'Title', with: 'My second post'

        click_on 'Create post'

        expect(current_path).to eq('/articles/my-second-post')
    end
end