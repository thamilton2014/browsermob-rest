#
# config.rb
#
module Browsermob
    module Rest
        module Util
            class Config
            # Return a hash of configuration strings
            # @return [Hash] - hash of configuration properties
            @props = {
                # REST endpoints
                :endpoints => {
                    :base_url => '',
                },

                # OAuth2 Authorization related configuration options
                :auth => {
                    :base_url => '',
                    :response_type_code => '',
                    :response_type_token => '',
                    :authorization_code_grant_type => '',
                    :authorization_endpoint => '',
                    :token_endpoint => '',
                    :token_info => '',
                    :api_key => '',
                    :api_secret => '',
                    :redirect_uri => ''
                },

                # Errors to be returned for various exceptions
                :errors => {
                    :api_key_missing => 'api_key required either explicitly or in configuration.',
                    :access_token_missing => 'access_token required explicitly.',
                    :id_or_object => 'Only an id or %s object are allowed for this method.',
                    :invalid_webhook => 'Invalid Webhook. The x-ctct-hmac-sha256 does not correspond to message encryption.',
                    :api_secret_missing => 'The api_secret is missing in explicit call or configuration.'
                }
            }

            class << self
                attr_accessor :props

                    def configure 
                        yield props if block_given?
                    end

                    # Get a configuration property given a specified location, example usage: Config::get('auth.token_endpoint')
                    # @param [String] index - location of the property to obtain
                    # @return [String]
                    def get(index)
                        properties = index.split('.')
                        get_value(properties, props)
                    end

                    private

                    # Navigate through a config array looking for a particular index
                    # @param [Array] index The index sequence we are navigating down
                    # @param [Hash, String] value The portion of the config array to process
                    # @return [String]
                    def get_value(index, value)
                        index = index.is_a?(Array) ? index : [index]
                        key = index.shift.to_sym
                        value.is_a?(Hash) and value[key] and value[key].is_a?(Hash) ?
                        get_value(index, value[key]) :
                        value[key]
                    end

                end # => Self
            end # => Config
        end # => Util
    end # => Rest
end # => Browsermob