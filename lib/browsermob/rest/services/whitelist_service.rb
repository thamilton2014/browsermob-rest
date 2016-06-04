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
                        response = get_request(url)
                    end

                    def update_proxy_whitelist(port, data)
                        url = base_url + sprintf(Util::Endpoints::PROXY_PORT_WHITELIST, port)
                        response = update_request(url, data)
                    end

                    def remove_proxy_whitelist(port)
                        url = base_url + sprintf(Util::Endpoints::PROXY_PORT_WHITELIST, port)
                        response = remove_request(url)
                    end

                end # => Self
            end # => WhitelistService
        end # => Services
    end # => Rest
end # => Browsermob