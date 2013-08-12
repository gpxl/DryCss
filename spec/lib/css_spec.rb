require File.expand_path('../../spec_helper.rb', __FILE__)

describe DryCss::CSS do
  it 'has a value' do
    css = DryCss::CSS.new('http://www.example.com/example.css')
    DryCss::Parser.stub(:load_uri!) { true }
    css.value.should_not be_nil?
  end
end
