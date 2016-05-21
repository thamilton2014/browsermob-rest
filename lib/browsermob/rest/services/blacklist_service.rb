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
                        get_request(url)
                    end

                    def update_proxy_blacklist(port, list)
                        url = base_url + sprintf(Util::Endpoints::PROXY_PORT_BLACKLIST, port)
                        update_request(url, list)
                    end

                    def remove_proxy_blacklist(port)
                        url = base_url + sprintf(Util::Endpoints::PROXY_PORT_BLACKLIST, port)
                        remove_request(url)
                    end

                end # => 
            end # => 
        end # => 
    end # => 
end # => 
