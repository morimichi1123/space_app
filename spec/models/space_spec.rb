require 'rails_helper'

RSpec.describe Space, type: :model do
    before do
        @space = FactoryBot.build(:space)
    end

    describe 'validate of space information' do
        it { is_expected.to validate_presence_of :space_name }
        it { is_expected.to validate_length_of(:space_name).is_at_most(50) }
        it { is_expected.to validate_presence_of :ward_id }
        it { is_expected.to validate_length_of(:ward_id).is_at_most(2) }
        it { is_expected.to validate_presence_of :price }
        it { is_expected.to validate_length_of(:price).is_at_most(50) }
    end
end