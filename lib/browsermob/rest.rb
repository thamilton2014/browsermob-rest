#
# rest.rb
#
# require_relative "browsermob/rest/version"
require "rest-client"

module Browsermob
  module Rest

    require_relative "rest/api"
    require_relative "rest/version"

    module Services
        require_relative "rest/services/base_service"
        require_relative "rest/services/blacklist_service"
        require_relative "rest/services/whitelist_service"
        require_relative "rest/services/proxy_service"
        require_relative "rest/services/har_service"
    end

    module Util
        require_relative "rest/util/config"
        require_relative "rest/util/endpoints"
    end

  end # => Rest
end # => Browsermob
