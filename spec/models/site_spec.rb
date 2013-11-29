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

  describe '.heroku_url' do
    let(:url) { 'http://example.com' }
    subject { site }
    before do
      Resolv.stub(:getaddress).and_return(ip_address)
      site.url = url
      site.save
    end

    context 'herokuの旧カスタムドメイン用IPアドレスでホストされている場合' do
      Site::HEROKU_IPS.each do |ip_address|
        context "#{ip_address}である場合" do
          let(:ip_address) { ip_address }
          it { should be_valid }
        end
      end
    end

    context 'herokuの旧カスタムドメイン用IPアドレスでホストされていない場合' do
      before do
        Resolv::DNS.any_instance.stub_chain(:getresource, :name, :to_s).and_return(cname)
      end
      let(:ip_address) { '192.168.0.1' }
      context 'CNAMEがherokuである場合' do
        let(:cname) { 'example.herokuapp.com' }
        it { should be_valid }
      end

      context 'CNAMEがherokuでない場合' do
        let(:cname) { 'example.com' }
        it { should_not be_valid }
      end
    end
  end
end
