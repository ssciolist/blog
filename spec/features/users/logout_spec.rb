require 'rails_helper'

RSpec.describe 'Log out function exists' do
    it 'a registered User can log in and out' do
            sole_user = User.create(username: 'MeganArellano', password: 'MyPassword')

            visit '/admin'
            fill_in :username, with: "#{sole_user.username}"
            fill_in :password, with: "#{sole_user.password}"
            click_on 'Log in'
            
            expect(current_path).to eq(root_path)
            click_on 'Log out'

            expect(current_path).to eq(root_path)

            expect(page).not_to have_link('Log out')
    end
end