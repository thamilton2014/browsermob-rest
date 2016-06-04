#

# endpoints.rb
#
module Browsermob
    module Rest
        module Util
            class Endpoints

                PROXY                       = "proxy/"
                PROXY_PORT                  = "proxy/%s/"
                PROXY_PORT_HAR              = "proxy/%s/har/"
                PROXY_PORT_HAR_PAGEREF      = "proxy/%s/har/pageRef/"
                PROXY_PORT_WHITELIST        = "proxy/%s/whitelist/"
                PROXY_PORT_BLACKLIST        = "proxy/%s/blacklist/"
                PROXY_PORT_LIMIT            = "proxy/%s/limit/"
                PROXY_PORT_HEADERS          = "proxy/%s/headers/"
                PROXY_PORT_HOSTS            = "proxy/%s/hosts/"
                PROXY_PORT_AUTH_BASIC       = "proxy/%s/auth/basic/%s/"
                PROXY_PORT_WAIT             = "proxy/%s/wait/"
                PROXY_PORT_TIMEOUT          = "proxy/%s/timeout/"
                PROXY_PORT_REWRITE          = "proxy/%s/rewrite/"
                PROXY_PORT_RETRY            = "proxy/%s/retry/"
                PROXY_PORT_DNS_CACHE        = "proxy/%s/dns/cache/"

            end # => Endpoints
        end # => Util
    end # => Rest
end # => Browsermob