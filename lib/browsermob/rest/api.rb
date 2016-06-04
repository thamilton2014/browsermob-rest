#
# api.rb
# Browsermob
#
module Browsermob
    module Rest
        #
        # This class acts as the interface for the services for Browsermob
        #
        class Api

            # 
            # Create a new Browsermob rest client instance
            # 
            # @return [Api]
            #
            # @example
            #   
            #   client = Browsermob::Rest::Api.new
            #
            def initialize

            end

            #
            # Get a list of ports attached to ProxyServer instances managed by ProxyManager
            #
            # @return [Api]
            #
            # @example
            #
            #   client.get_proxies
            #
            def get_proxies
                Services::ProxyService.get_proxies()
            end

            #
            #
            #
            def remove_proxy(port)
                Services::ProxyService.remove_proxy(port)
            end

            #
            #
            #
            def update_proxy_har(port, data)
                Services::HarService.update_proxy_har(port, data)
            end

            #
            #
            #
            def update_proxy_har_pageref(port, data)
                Services::HarService.update_proxy_har_pageref(port, data)
            end

            #
            #
            #
            def get_proxy_har(port)
                Services::HarService.get_proxy_har(port)
            end

            #
            #
            #
            def get_proxy_whitelist(port)
                Services::WhitelistService.get_proxy_whitelist(port)
            end

            #
            #
            #
            def update_proxy_whitelist(port, data)
                Services::WhitelistService.update_proxy_whitelist(port, data)
            end

            #
            #
            #
            def remove_proxy_whitelist(port)
                Services::WhitelistService::remove_proxy_whitelist(port)
            end

            #
            #
            #
            def get_proxy_blacklist(port)
                Services::BlacklistService.get_proxy_blacklist(port)
            end

            #
            #
            #
            def update_proxy_blacklist(port, data)
                Services::BlacklistService.update_proxy_blacklist(port, data)
            end

            #
            #
            #
            def remove_proxy_blacklist(port)
                Services::BlacklistService.remove_proxy_blacklist(port)
            end

            #
            #
            #
            def update_proxy_limit(port, data)
                Services::ProxyService.update_proxy_limit(port, data)
            end

            #
            #
            #
            def get_proxy_limit(port)
                Services::ProxyService.get_proxy_limit(port)
            end

            #
            #
            #
            def add_proxy_headers(port, data)
                Services::ProxyService.add_proxy_headers(port, data)
            end

            #
            #
            #
            def add_proxy_hosts(port, data)
                Services::ProxyService.add_proxy_hosts(port, data)
            end

            def add_proxy_authentication(port, domain, data)
                Services::ProxyService.add_proxy_authentication(port, domain, data)
            end

            #
            #
            #
            def update_proxy_wait(port, data)
                Services::ProxyService.update_proxy_wait(port, data)
            end

            #
            #
            #
            def update_proxy_timeout(port, data)
                Services::ProxyService.update_proxy_timeout(port, data)
            end

            #
            #
            #
            def update_proxy_redirect(port, data)
                Services::ProxyService.update_proxy_redirect(port, data)
            end

            #
            #
            #
            def remove_proxy_redirect(port)
                Services::ProxyService.remove_proxy_redirect(port)
            end

            #
            #
            #
            def add_proxy_retry_count(port, data)
                Services::ProxyService::add_proxy_retry_count(port, data)
            end

            #
            #
            #
            def remove_proxy_dns_cache(port)
                Services::ProxyService.remove_proxy_dns_cache(port)
            end

        end # => Api
    end # => Rest
end # => Browsermob