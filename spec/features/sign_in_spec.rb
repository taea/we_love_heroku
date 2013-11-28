require "spec_helper"

describe 'sign_in' do
  let(:connection) { build(:connection) }
  let(:new_user) { build(:user, connections: [connection]) }

  Connection::PROVIDERS.each do |provider|
    context "#{provider.to_s} アカウントでログインする場合 " do
      before do
        oauth_sign_in(new_user, provider, false)
      end
      it 'ログインメッセージが表示される' do
        page.should have_content "#{provider.to_s}アカウントでログインしました。"
      end
    end
  end
end
