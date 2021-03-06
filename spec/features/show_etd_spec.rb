require 'rails_helper'

RSpec.feature 'Display an ETD' do
  let(:title) { ['Journey to Skull Island'] }
  let(:creator) { ['Quest, Jane'] }
  let(:keyword) { ['Pirates', 'Adventure'] }
  let(:visibility) { Hydra::AccessControls::AccessRight::VISIBILITY_TEXT_VALUE_PUBLIC }
  let(:degree) { ["Master of Pirate Studies"] }
  let :etd do
    Etd.create(
      title: title,
      creator: creator,
      keyword: keyword,
      visibility: visibility,
      degree: degree)
  end

  context 'Show ETDs' do

    scenario "Show a public ETD" do
      visit("/concern/etds/#{etd.id}")
      expect(page).to have_content etd.title.first
      expect(page).to have_content etd.creator.first
      expect(page).to have_content etd.keyword.first
      expect(page).to have_content etd.keyword.last
      expect(page).to have_content etd.degree.first
    end
  end
end
