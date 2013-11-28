require 'spec_helper'

describe User do
  let(:user) { create(:user) }

  describe 'ユーザーが生成出来る' do
    subject { user }
    it { should be_instance_of User }
  end

  describe '#me?' do
    subject { user.me?(other) }

    context 'me' do
      let(:other) { user }
      it { should be_true }
    end

    context 'other' do
      let(:other) { create(:user) }
      it { should be_false }
    end
  end
end
