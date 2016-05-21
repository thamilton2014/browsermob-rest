#
# whitelist_service.rb
#
module Browsermob
    module Rest
        module Services
            class WhitelistService < BaseService
                class << self

                    def get_proxy_whitelist(port)
                        url = base_url + sprintf(Util::Endpoints::PROXY_PORT_WHITELIST, port)
                        get_request(url)
                    end

                    def update_proxy_whitelist(port, data)
                        url = base_url + sprintf(Util::Endpoints::PROXY_PORT_WHITELIST, port)
                        update_request(url, data)
                    end

                    def remove_proxy_whitelist(port)
                        url = base_url + sprintf(Util::Endpoints::PROXY_PORT_WHITELIST, port)
                        remove_request(url)
                    end

                end # => 
            end # => 
        end # => 
    end # => 
end # => 