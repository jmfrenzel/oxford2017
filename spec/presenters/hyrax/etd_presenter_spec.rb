# Generated via
#  `rails generate hyrax:work Etd`
require 'rails_helper'

RSpec.describe Hyrax::EtdPresenter do
  subject { presenter }

  let(:title) { ['Journey to Skull Island'] }
  let(:creator) { ['Quest, Jane'] }
  let(:keyword) { ['Pirates', 'Adventure'] }
  let(:degree) { ['Master of Pirate Studies'] }
  let(:visibility) { Hydra::AccessControls::AccessRight::VISIBILITY_TEXT_VALUE_PUBLIC }
  let :etd do
    Etd.new(
      title: title,
      creator: creator,
      keyword: keyword,
      degree: degree,
      visibility: visibility
    )
  end

  let(:presenter) do
    described_class.new(SolrDocument.new(etd.to_solr), nil)
  end

  # If the fields require no addition logic for display, you can simply delegate
  # them to the solr document
  it { is_expected.to delegate_method(:title).to(:solr_document) }
  it { is_expected.to delegate_method(:degree).to(:solr_document) }
end
