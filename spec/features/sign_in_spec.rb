require "spec_helper"

describe 'sign_in' do
  let(:connection) { build(:connection) }
  let(:new_user) { build(:user, connections: [connection]) }

  describe 'ログイン画面へ移動する' do
    before do
      visit signin_path
    end
    Connection::PROVIDERS.each do |provider|
      it "#{provider.to_s} ログインボタンが表示されていること" do
        page.should have_css(".btn-#{provider}")
      end

      context "#{provider.to_s} アカウントでログインする場合 " do
        before do
          oauth_sign_in(new_user, provider, false)
        end

        it 'ログインしたプロバイダーのボタンは表示されないこと' do
          page.should_not have_css(".btn-#{provider}")
        end
      end
    end

    context '全て接続済の場合、ログインボタンは表示されないこと' do
      let(:user) { create(:user) }
      before do
        sign_in user
        User.any_instance.should_receive(:connected_all?).and_return(true)
        reload
      end
      Connection::PROVIDERS.each do |provider|
        it "#{provider.to_s} ログインボタンが表示されないこと" do
          page.should_not have_css(".btn-#{provider}")
        end
      end
    end
  end

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
