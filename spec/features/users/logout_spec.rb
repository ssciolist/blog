require 'rails_helper'

RSpec.describe 'Log out function exists', focus: :true do
    it 'a registered User can log in and out' do
            sole_user = User.create(username: 'MeganArellano', password: 'MyPassword')

            visit '/admin'

            fill_in 'user[username]', with: "#{sole_user.username}"
            fill_in 'user[password]', with: "#{sole_user.password}"
            click_on 'Login'
            
            expect(current_path).to eq(root_path)
            click_on 'Log out'

            expect(current_path).to eq(root_path)

            expect(page).not_to have_link('Create new article')
    end
end