require 'spec_helper'

describe Site do
  let(:site) { create(:site) }

  describe 'サイトを作成できる' do
    subject { site }
    it { should be_instance_of Site }
  end

  describe 'relations' do
    it { should belong_to(:user) }
  end
end
