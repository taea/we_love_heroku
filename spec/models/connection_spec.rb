require 'spec_helper'

describe Connection do
  let(:user) { create(:user) }
  let(:connection) { create(:connection, user: user) }

  describe 'コネクションを作成できる' do
    subject { connection }
    it { should be_instance_of Connection }
  end

  describe 'relations' do
    it { should belong_to(:user) }
  end
end
