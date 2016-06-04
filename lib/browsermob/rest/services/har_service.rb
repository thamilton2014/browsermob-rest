#
# har_service.rb
#
module Browsermob
    module Rest
        module Services
            class HarService < BaseService
                class << self

                    def get_proxy_har(port)
                        url = base_url + sprintf(Util::Endpoints::PROXY_PORT_HAR, port)
                        response = get_request(url)
                    end
                    
                    def update_proxy_har(port, data)
                        url = base_url + sprintf(Util::Endpoints::PROXY_PORT_HAR, port)
                        response = update_request(url, data)
                    end

                    def update_proxy_har_pageref(port, data)
                        url = base_url + sprintf(Util::Endpoints::PROXY_PORT_HAR_PAGEREF, port)
                        response = update_request(url, data)
                    end

                end # => Self
            end # => HarService
        end # => Services
    end # => Rest
end # => Browsermob