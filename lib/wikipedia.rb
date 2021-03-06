Dir[File.dirname(__FILE__) + '/wikipedia/**/*.rb'].each { |f| require f }

require 'uri'

module Wikipedia
  # Examples :
  # page = Wikipedia.find('Rails')
  # => #<Wikipedia:0x123102>
  # page.content
  # => wiki content appears here

  # basically just a wrapper for doing
  # client = Wikipedia::Client.new
  # client.find('Rails')
  #
  def self.find( page, options = {} )
    client.find( page, options )
  end

  def self.find_image( title, options = {} )
    client.find_image( title, options )
  end

  def self.find_page_image( title, width = nil, options = {} )
    client.find_page_image( title, width, options )
  end

  def self.find_random( options = {} )
    client.find_random( options )
  end

  def self.Configure(&block)
    Configuration.instance.instance_eval(&block)
  end

  Configure {
    protocol            'https'
    domain              'en.wikipedia.org'
    path                'w/api.php'
    localized_redirect  'REDIRECT'
    user_agent(
      'wikipedia-client/1.3 (https://github.com/kristianm/wikipedia-client) (fork of https://github.com/kenpratt/wikipedia-client)'
    )
  }

  private

  def self.client
    @client ||= Wikipedia::Client.new
  end
end
