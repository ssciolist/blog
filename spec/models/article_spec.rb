require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'validations' do
    it{should validate_prescence_of :title}
  end
end
