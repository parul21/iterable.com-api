class ServiceGateway
    attr_accessor :action, :payload
    
    def initialize(action, payload)
        self.payload = payload
        self.action = action
    end

    def make_api_call 
        # Create the HTTP request
        uri = self.get_uri
        request = Net::HTTP::Post.new(self.uri_path)
        request['Content-Type'] = 'application/json'
        request['Api-Key'] = 'ITERABLE_API_KEY'
        request.body = self.payload.to_json
    
        # Send the request
        response = Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
          http.request(request)
        end
    end

    private
    def get_uri
        URI.parse(self.class.endpoint(self.action))
    end

    def uri_path
        self.get_uri.path
    end

    def self.endpoint action
      endpoints_mappings[action]
    end

    def self.endpoints_mappings
        {
            "email_target": "https://api.iterable.com/api/email/target",
            "event_track": "https://api.iterable.com/api/events/track"
    }.with_indifferent_access
    end

end