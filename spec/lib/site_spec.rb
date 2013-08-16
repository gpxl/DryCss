require File.expand_path('../../spec_helper.rb', __FILE__)

describe DryCss::Site do
  it 'returns array of css uris' do
    file_name = File.dirname(__FILE__) + '/../fixtures/example.html'
    @site = DryCss::Site.new(file_name)
    @site.uris.should eq(['http://www.example.com/example.css', 'http://www.example.com/example2.css'])
  end

  it 'returns full uris from relative links' do
    file_name = File.dirname(__FILE__) + '/../fixtures/example_relative.html'
    @site = DryCss::Site.new(file_name)
    # We prepend 'file_name' for tests in place of uri for production
    @site.uris.should eq([
                         file_name + '/example.css',
                         file_name + '/example2.css',
                         'http://www.example.com/example2.css'
    ])
  end

end
