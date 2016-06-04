#
# base_service.rb
#
module Browsermob
    module Rest
        module Services
            class BaseService
                class << self

                    protected

                    # Return required headers for making an http request
                    # @param [String] content_type - The MIME type of the body of the request, default is 'application/json'
                    # @return [Hash] - authorization headers
                    def get_headers(content_type = 'application/json')
                        {
                            :content_type => content_type,
                            :accept => 'application/json',
                        }
                    end 

                    def base_url
                        Util::Config.get("endpoints.base_url")
                    end

                    def add_request(url, data)
                        RestClient.post(url, data, get_headers())
                    end

                    def remove_request(url)
                        RestClient.delete(url, get_headers())
                    end

                    def update_request(url, data)
                        RestClient.put(url, data, get_headers())
                    end

                    def get_request(url)
                        RestClient.get(url, get_headers())
                    end

                end # => Self
            end # => BaseService
        end # => Services
    end # => Rest
end # => Browsermob