require File.expand_path('../../spec_helper.rb', __FILE__)

describe DryCss::CSS do
  before(:all) do
    file_name = 'file://' + File.expand_path(File.dirname(__FILE__)) + '/../fixtures/example.css'
    @css = DryCss::CSS.new(file_name)
  end

  it 'returns a CSSParser object' do
    @css.parser.should be_a(DryCss::Parser)
  end

  it 'returns array of color values' do
    @css.colors.should eq({:counts => {:"#fff;"=>1, :"#000;"=>2}, :total => 3})
  end

end
