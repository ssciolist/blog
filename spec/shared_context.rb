RSpec.shared_context 'registered_user' do
    before do
        sole_user = User.create(username: 'MeganArellano', password: 'MyPassword')
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(sole_user)
    end
end