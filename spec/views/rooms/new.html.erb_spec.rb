require 'spec_helper'

describe "rooms/new" do
  before(:each) do
    assign(:room, stub_model(Room,
      :user_id => 1,
      :name => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new room form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => rooms_path, :method => "post" do
      assert_select "input#room_user_id", :name => "room[user_id]"
      assert_select "input#room_name", :name => "room[name]"
      assert_select "textarea#room_description", :name => "room[description]"
    end
  end
end
