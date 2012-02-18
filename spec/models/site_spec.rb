require 'spec_helper'

describe Site do
  describe 'hash_tags' do
    let(:site) { Factory(:site) }
    it { site.hash_tags.should === "##{site.hash_tag}"}
  end
  
  describe 'search' do
    it { Site.search('test').should be_instance_of ActiveRecord::Relation }
  end
  
  describe 'same_creators' do
    let(:site) { Factory(:site) }
    it { site.same_creators.size.should === 1 }
  end
  
  describe 'pickups' do
    it { Site.pickups.should be_instance_of Array }
  end
end