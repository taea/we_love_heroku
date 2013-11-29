require "spec_helper"

describe 'Users' do
  let(:connection) { build(:connection) }
  let(:user) { create(:user, connections: [connection]) }
  let!(:sites) { create_list(:site, 20, user: user) }

  describe 'ユーザーページを表示' do
    before do
      visit user_path(user)
    end

    it 'ユーザーが登録したサイトが表示されること' do
      sites.each do |site|
        page.should have_content(site.name)
      end
    end
  end
end
