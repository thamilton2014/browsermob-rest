#
# blacklist_service.rb
#
module Browsermob
    module Rest
        module Services
            class BlacklistService < BaseService
                class << self

                    def get_proxy_blacklist(port)
                        url = base_url + sprintf(Util::Endpoints::PROXY_PORT_BLACKLIST, port)
                        response = get_request(url)
                    end

                    def update_proxy_blacklist(port, list)
                        url = base_url + sprintf(Util::Endpoints::PROXY_PORT_BLACKLIST, port)
                        response = update_request(url, list)
                    end

                    def remove_proxy_blacklist(port)
                        url = base_url + sprintf(Util::Endpoints::PROXY_PORT_BLACKLIST, port)
                        response = remove_request(url)
                    end

                end # => Self
            end # => BlacklistService
        end # => Services
    end # => Rest
end # => Browsermob
