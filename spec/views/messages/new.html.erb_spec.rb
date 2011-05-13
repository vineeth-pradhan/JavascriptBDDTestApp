require 'spec_helper'

describe "messages/new.html.erb" do
  let(:message) do
    mock_model("Message").as_new_record.as_null_object
  end
  before do
    assign(:message, message)
  end
  it "renders a form to create a new message" do
#    assign(:message, mock_model("Message").as_new_record.as_null_object)
    render
    rendered.should have_selector("form",
      :method => "post",
      :action => messages_path
      ) do |form|
      form.should have_selector("input", :type => "submit")
    end
  end
  
  it "renders a text field for the message title" do
#    assign(:message, mock_model("Message", :title => "the title").as_new_record)
    message.stub(:title => "the title")
    render
    rendered.should have_selector("form") do |form|
      form.should have_selector("input",
      :name => "message[title]",
      :type => "text",
      :value => "the title")
    end
#    rendered.should have_selector("input",
#      :type => "text",
#      :name => "message[title]",
#      :value => "the title")
  end
  
  it "renders a text area for the message text" do
    message.stub(:text => "the message")
    render
    rendered.should have_selector("form") do |form|
      form.should have_selector("textarea",
      :name => "message[text]",
      :content => "the message")
    end      
  end
end