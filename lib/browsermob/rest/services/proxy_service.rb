#
# proxy_service.rb
#
module Browsermob
    module Rest
        module Services
            class ProxyService < BaseService
                class << self

                    def get_proxies
                        url = base_url + Util::Endpoints::PROXY
                        get_request(url)
                    end

                    def remove_proxy(port)
                        url = base_url + sprintf(Util::Endpoints::PROXY_PORT, port)
                        remove_request(url)
                    end

                    def update_proxy_limit(port, data)
                        url = base_url + sprintf(Util::Endpoints::PROXY_PORT_LIMIT, port)
                        update_request(url, data)
                    end

                    def get_proxy_limit(port)
                        url = base_url + sprintf(Util::Endpoints::PROXY_PORT_LIMIT, port)
                        get_request(url)
                    end

                    def add_proxy_headers(port, data)
                        url = base_url + sprintf(Util::Endpoints::PROXY_PORT_HEADERS, port)
                        add_request(url, data)
                    end

                    def add_proxy_hosts(port, data)
                        url = base_url + sprintf(Util::Endpoints::PROXY_PORT_HOSTS, port)
                        add_request(url, data)
                    end

                    def add_proxy_authentication(port, domain, data)
                        url = base_url + sprintf(Util::Endpoints::PROXY_PORT_AUTH_BASIC, port, domain)
                        add_request(url, data)
                    end

                    def update_proxy_wait(port, data)
                        url = base_url + sprintf(Util::Endpoints::PROXY_PORT_WAIT, port)
                        update_request(url, data)
                    end

                    def update_proxy_timeout(port, data)
                        url = base_url + sprintf(Util::Endpoints::PROXY_PORT_TIMEOUT, port)
                        update_request(url, data)
                    end

                    def update_proxy_redirect(port, data)
                        url = base_url + sprintf(Util::Endpoints::PROXY_PORT_REWRITE, port)
                        update_request(url, data)
                    end

                    def remove_proxy_redirect(port)
                        url = base_url + sprintf(Util::Endpoints::PROXY_PORT_REWRITE, port)
                        remove_request(url)
                    end

                    def add_proxy_retry_count(port, data)
                        url = base_url + sprintf(Util::Endpoints::PROXY_PORT_RETRY, port)
                        add_request(url, data)
                    end

                    def remove_proxy_dns_cache(port)
                        url = base_url + sprintf(Util::Endpoints::PROXY_PORT_DNS_CACHE, port)
                        remove_request(url)
                    end

                end # => 
            end # =>
        end # =>  
    end # => 
end # => 