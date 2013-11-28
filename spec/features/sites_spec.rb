require "spec_helper"

describe 'Sites' do
  let(:connection) { build(:connection) }
  let(:user) { create(:user, connections: [connection]) }
  let!(:sites) { create_list(:site, 20) }

  context 'ログインしてない場合' do
    let(:site) { sites.last }
    describe 'サイト一覧を表示' do
      before do
        visit sites_path
      end
      it 'サイトが表示されること' do
        page.should have_content(site.name)
      end

      describe 'サイト詳細を表示' do
        before do
          find("#site_#{site.id} h3 a").click
        end

        it 'サイト詳細ページへ遷移すること' do
          current_path.should eq site_path(site)
        end

        it '編集ボタンが表示されないこと' do
          page.should_not have_css('.btn-edit')
        end

        describe 'サイト編集画面を表示' do
          before do
            visit edit_site_path(site)
          end

          it 'ログイン画面へ遷移すること' do
            current_path.should eq root_path
          end
        end
      end
    end

    describe 'サイト作成画面を表示' do
      before do
        visit new_site_path
      end

      it 'サイト作成画面へ遷移すること' do
        current_path.should eq new_site_path
      end

      describe '登録' do
        context 'フォームを埋める場合' do
          let(:new_site) { build(:site) }
          before do
            find('#site_url').set(new_site.url)
            find('#site_name').set(new_site.name)
            find('#site_creator').set(new_site.creator)
            find('#site_description').set(new_site.description)
            find('#site_hash_tag').set(new_site.hash_tag)
            find('#site_repository_url').set(new_site.repository_url)
            find('#site_please_design').set(true)
            find("form#new_site input[type=submit]").click
          end

          it 'メッセージが表示されること' do
            page.should have_content(I18n.t('sites.create.created'))
          end
        end

        context 'フォームを埋めない場合' do
          before do
            find('#site_url').set('')
            find('#site_name').set('')
            find('#site_creator').set('')
            find('#site_description').set('')
            find("form#new_site input[type=submit]").click
          end

          it 'エラーメッセージが表示されること' do
            page.should have_css('.alert')
          end
        end
      end
    end
  end

  context 'ログインしてる場合' do
    let(:site) { sites.last }
    describe 'サイト一覧を表示' do
      before do
        sign_in user
        visit sites_path
      end
      it 'サイトが表示されること' do
        page.should have_content(site.name)
      end

      describe 'サイト詳細を表示' do
        before do
          find("#site_#{site.id} h3 a").click
        end

        it 'サイト詳細ページへ遷移すること' do
          current_path.should eq site_path(site)
        end

        context '自分の登録したサイトではない場合' do
          it '編集ボタンが表示されるないこと' do
            page.should_not have_css('.btn-edit')
          end

          describe 'サイト編集画面を表示' do
            before do
              visit edit_site_path(site)
            end

            it 'サイト編集画面へ遷移すること' do
              current_path.should eq edit_site_path(site)
            end
          end
        end

        context '自分の登録したサイトの場合' do
          before do
            site.user = user
            site.save!
            reload
          end

          it '編集ボタンが表示されること' do
            page.should have_css('.btn-edit')
          end

          describe 'サイト編集画面を表示' do
            before do
              find('.btn-edit').click
            end

            it 'サイト編集画面へ遷移すること' do
              current_path.should eq edit_site_path(site)
            end

            describe '更新' do
              context 'フォームを埋める場合' do
                let(:new_site) { build(:site) }
                before do
                  find('#site_url').set(new_site.url)
                  find('#site_name').set(new_site.name)
                  find('#site_creator').set(new_site.creator)
                  find('#site_description').set(new_site.description)
                  find('#site_hash_tag').set(new_site.hash_tag)
                  find('#site_repository_url').set(new_site.repository_url)
                  find('#site_please_design').set(true)
                  find("form#edit_site_#{site.id} input[type=submit]").click
                end

                it 'メッセージが表示されること' do
                  page.should have_content(I18n.t('sites.update.updated'))
                end
              end

              context 'フォームを埋めない場合' do
                let(:new_site) { build(:site) }
                before do
                  find('#site_url').set('')
                  find('#site_name').set('')
                  find('#site_creator').set('')
                  find('#site_description').set('')
                  find("form#edit_site_#{site.id} input[type=submit]").click
                end

                it 'エラーメッセージが表示されること' do
                  page.should have_css('.alert')
                end
              end
            end

            describe '削除', :js do
              before do
                find('.btn-delete').click
              end

              it 'メッセージが表示されること' do
                page.should have_content(I18n.t('sites.destroy.destroyed'))
              end
            end
          end
        end
      end
    end

    describe 'サイト作成画面を表示' do
      before do
        visit new_site_path
      end

      it 'サイト編集画面へ遷移すること' do
        current_path.should eq new_site_path
      end

      describe '登録' do
        context 'フォームを埋める場合' do
          let(:new_site) { build(:site) }
          before do
            find('#site_url').set(new_site.url)
            find('#site_name').set(new_site.name)
            find('#site_creator').set(new_site.creator)
            find('#site_description').set(new_site.description)
            find('#site_hash_tag').set(new_site.hash_tag)
            find('#site_repository_url').set(new_site.repository_url)
            find('#site_please_design').set(true)
            find("form#new_site input[type=submit]").click
          end

          it 'メッセージが表示されること' do
            page.should have_content(I18n.t('sites.create.created'))
          end
        end

        context 'フォームを埋めない場合' do
          before do
            find('#site_url').set('')
            find('#site_name').set('')
            find('#site_creator').set('')
            find('#site_description').set('')
            find("form#new_site input[type=submit]").click
          end

          it 'エラーメッセージが表示されること' do
            page.should have_css('.alert')
          end
        end
      end
    end
  end
end
