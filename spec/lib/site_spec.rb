require File.expand_path('../../spec_helper.rb', __FILE__)

describe DryCss::Site do
  before(:all) do
    file_name = File.dirname(__FILE__) + '/../fixtures/example.html'
    @site = DryCss::Site.new(file_name)
  end

  it 'returns array of css uris' do
    @site.uris.should eq(['http://www.example.com/example.css', 'http://www.example.com/example2.css'])
  end

end
