module Wikipedia
  class Page
    def initialize(json)
      require 'json'
      @json = json
      @data = JSON::load(json)
    end

    def page
      @data['query']['pages'].values.first if @data['query']['pages']
    end

    def url
      page['thumbnail']['source'] if page['thumbnail']
    end

    def width
      page['thumbnail']['width'] if page['thumbnail']
    end

    def height
      page['thumbnail']['height'] if page['thumbnail']
    end
  end
end
