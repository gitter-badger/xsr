module XSR
  # Response object is created by Client after a HTTP call
  class Response
    attr_reader :http_response

    def initialize(http_response)
      @http_response = http_response
    end

    def success?
      @http_response.is_a? Net::HTTPSuccess
    end

    def bad_request?
      @http_response.is_a? Net::HTTPBadRequest
    end

    def not_found?
      @http_response.is_a? Net::HTTPNotFound
    end

    def unauthorized?
      @http_response.is_a? Net::HTTPUnauthorized
    end

    def forbidden?
      @http_response.is_a? Net::HTTPForbidden
    end

    def server_error?
      @http_response.is_a? Net::HTTPServerError
    end

    def body
      MultiJson.load @http_response.body, symbolize_keys: true
    end
  end
end
