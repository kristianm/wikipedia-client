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
      page['thumbnail']['source']
    end

    def width
      page['thumbnail']['width']
    end

    def height
      page['thumbnail']['height']
    end
  end
end
