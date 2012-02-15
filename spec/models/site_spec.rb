require 'spec_helper'

describe Site do
  describe 'hash_tags' do
    let(:site) { Factory(:site) }
    it { site.hash_tags.should === "##{site.hash_tag}"}
  end
  
  describe 'search' do
    it { Site.search('test').should be_instance_of ActiveRecord::Relation }
  end
end