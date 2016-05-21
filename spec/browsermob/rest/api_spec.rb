#
# api_spec.rb
#
require "spec_helper"

describe Browsermob::Rest::Api do

    describe "test methods" do
        before(:each) do
            # @api = Browsermob::Rest::Api.new("YW55c3RyaW5nOjllOWZkMzI3YjJjNjExMzhiNmFjNTVhZThiOTg3ZTg0LXVzMTM=")
            Browsermob::Rest::Util::Config.configure do |config|
                config[:endpoints][:base_url] = "http://127.0.0.1:8080/"
            end

            @api = Browsermob::Rest::Api.new
            @request = double('http request', :user => nil, :password => nil, :url => "http://example.com")
        end

        describe "get_proxies" do
            it " get a list of ports attached to ProxyServer instances managed by ProxyManager" do
                json_response = load_file("generic.json")
                net_http_resp = Net::HTTPResponse.new(1.0, 200, 'OK')

                response = RestClient::Response.create(json_response, net_http_resp, {}, @request)
                allow(RestClient).to receive(:get).and_return(response)

                proxies = @api.get_proxies()
                expect(proxies).to be_a Hash
            end
        end

        describe "update_proxy_har" do
            it "creates a new HAR attached to the proxy and returns the HAR content if there was a previous HAR." do
                json_response = load_file("generic.json")
                net_http_resp = Net::HTTPResponse.new(1.0, 200, 'OK')

                response = RestClient::Response.create(json_response, net_http_resp, {}, @request)
                allow(RestClient).to receive(:put).and_return(response)

                proxy = @api.update_proxy_har("test_port", {})
                expect(proxy).to be_a Hash
            end
        end

        describe "update_proxy_har_pageref" do
            it "starts a new page on the existing HAR" do
                json_response = load_file("generic.json")
                net_http_resp = Net::HTTPResponse.new(1.0, 200, 'OK')

                response = RestClient::Response.create(json_response, net_http_resp, {}, @request)
                allow(RestClient).to receive(:put).and_return(response)

                proxy = @api.update_proxy_har_pageref("test_port", {})
                expect(proxy).to be_a Hash
            end
        end

        describe "remove_proxy" do
            it "shuts down the proxy and closes the port" do
                json_response = load_file("generic.json")
                net_http_resp = Net::HTTPResponse.new(1.0, 200, 'OK')

                response = RestClient::Response.create(json_response, net_http_resp, {}, @request)
                allow(RestClient).to receive(:delete).and_return(response)

                proxy = @api.remove_proxy("test_port")
                expect(proxy).to be_a Hash
            end
        end

        describe "get_proxy_har" do
            it "returns the JSON/HAR content representing all the HTTP traffic passed through the proxy" do
                json_response = load_file("generic.json")
                net_http_resp = Net::HTTPResponse.new(1.0, 200, 'OK')

                response = RestClient::Response.create(json_response, net_http_resp, {}, @request)
                allow(RestClient).to receive(:get).and_return(response)

                har = @api.get_proxy_har("test_port")
                expect(har).to be_a Hash
            end
        end

        describe "get_proxy_whitelist" do
            it "Displays whitlelisted items" do
                json_response = load_file("generic.json")
                net_http_resp = Net::HTTPResponse.new(1.0, 200, 'OK')

                response = RestClient::Response.create(json_response, net_http_resp, {}, @request)
                allow(RestClient).to receive(:get).and_return(response)

                whitelist = @api.get_proxy_whitelist("test_port")
                expect(whitelist).to be_a Hash
            end
        end

        describe "update_proxy_whitelist" do
            it "Sets a list of URL patterns to whitelist" do
                json_response = load_file("generic.json")
                net_http_resp = Net::HTTPResponse.new(1.0, 200, 'OK')

                response = RestClient::Response.create(json_response, net_http_resp, {}, @request)
                allow(RestClient).to receive(:put).and_return(response)

                whitelist = @api.update_proxy_whitelist("test_port", {})
                expect(whitelist).to be_a Hash
            end
        end

        describe "remove_proxy_whitelist" do
            it "Clears all URL patterns from the whitelist" do
                json_response = load_file("generic.json")
                net_http_resp = Net::HTTPResponse.new(1.0, 200, 'OK')

                response = RestClient::Response.create(json_response, net_http_resp, {}, @request)
                allow(RestClient).to receive(:delete).and_return(response)

                whitelist = @api.remove_proxy_whitelist("test_port")
                expect(whitelist).to be_a Hash
            end
        end

        describe "get_proxy_blacklist" do
            it "Displays blacklisted items" do
                json_response = load_file("generic.json")
                net_http_resp = Net::HTTPResponse.new(1.0, 200, 'OK')

                response = RestClient::Response.create(json_response, net_http_resp, {}, @request)
                allow(RestClient).to receive(:get).and_return(response)

                blacklist = @api.get_proxy_blacklist("test_port")
                expect(blacklist).to be_a Hash
            end
        end

        describe "update_proxy_blacklist" do
            it "Set a URL to blacklist" do
                json_response = load_file("generic.json")
                net_http_resp = Net::HTTPResponse.new(1.0, 200, 'OK')

                response = RestClient::Response.create(json_response, net_http_resp, {}, @request)
                allow(RestClient).to receive(:put).and_return(response)

                blacklist = @api.update_proxy_blacklist("test_port", {})
                expect(blacklist).to be_a Hash
            end
        end

        describe "remove_proxy_blacklist" do
            it "Clears all URL patterns from the blacklist" do
                json_response = load_file("generic.json")
                net_http_resp = Net::HTTPResponse.new(1.0, 200, 'OK')

                response = RestClient::Response.create(json_response, net_http_resp, {}, @request)
                allow(RestClient).to receive(:delete).and_return(response)

                blacklist = @api.remove_proxy_blacklist("test_port")
                expect(blacklist).to be_a Hash
            end
        end

        describe "update_proxy_limit" do
            it "Limits the bandwidth through the proxy" do
                json_response = load_file("generic.json")
                net_http_resp = Net::HTTPResponse.new(1.0, 200, 'OK')

                response = RestClient::Response.create(json_response, net_http_resp, {}, @request)
                allow(RestClient).to receive(:put).and_return(response)

                limit = @api.update_proxy_limit("test_port", {})
                expect(limit).to be_a Hash
            end
        end

        describe "get_proxy_limit" do
            it "Dispalys the amount of data remaining to be uploaded" do
                json_response = load_file("generic.json")
                net_http_resp = Net::HTTPResponse.new(1.0, 200, 'OK')

                response = RestClient::Response.create(json_response, net_http_resp, {}, @request)
                allow(RestClient).to receive(:get).and_return(response)

                limit = @api.get_proxy_limit("test_port")
                expect(limit).to be_a Hash
            end
        end

        describe "add_proxy_headers" do
            it "Set and override HTTP Request headers" do
                json_response = load_file("generic.json")
                net_http_resp = Net::HTTPResponse.new(1.0, 200, 'OK')

                response = RestClient::Response.create(json_response, net_http_resp, {}, @request)
                allow(RestClient).to receive(:post).and_return(response)

                headers = @api.add_proxy_headers("test_port", {})
                expect(headers).to be_a Hash
            end
        end

        describe "add_proxy_hosts" do
            it "Overrides normal DNS lookups and remaps them" do
                json_response = load_file("generic.json")
                net_http_resp = Net::HTTPResponse.new(1.0, 200, 'OK')

                response = RestClient::Response.create(json_response, net_http_resp, {}, @request)
                allow(RestClient).to receive(:post).and_return(response)

                hosts = @api.add_proxy_hosts("test_port", {})
                expect(hosts).to be_a Hash
            end
        end

        describe "add_proxy_authentication" do
            it "Sets automatic basic authentication for the specified domain" do
                json_response = load_file("generic.json")
                net_http_resp = Net::HTTPResponse.new(1.0, 200, 'OK')

                response = RestClient::Response.create(json_response, net_http_resp, {}, @request)
                allow(RestClient).to receive(:post).and_return(response)

                authentication = @api.add_proxy_authentication("test_port", "test_domain", {})
                expect(authentication).to be_a Hash
            end
        end

        describe "update_proxy_wait" do
            it "Waits till all requests are being made" do
                json_response = load_file("generic.json")
                net_http_resp = Net::HTTPResponse.new(1.0, 200, 'OK')

                response = RestClient::Response.create(json_response, net_http_resp, {}, @request)
                allow(RestClient).to receive(:put).and_return(response)

                wait = @api.update_proxy_wait("test_port", {})
                expect(wait).to be_a Hash
            end
        end

        describe "update_proxy_timeout" do
            it "Handles different proxy timeouts" do
                json_response = load_file("generic.json")
                net_http_resp = Net::HTTPResponse.new(1.0, 200, 'OK')

                response = RestClient::Response.create(json_response, net_http_resp, {}, @request)
                allow(RestClient).to receive(:put).and_return(response)

                timeout = @api.update_proxy_timeout("test_port", {})
                expect(timeout).to be_a Hash
            end
        end

        describe "update_proxy_redirect" do
            it "Redirecting URLs" do
                json_response = load_file("generic.json")
                net_http_resp = Net::HTTPResponse.new(1.0, 200, 'OK')

                response = RestClient::Response.create(json_response, net_http_resp, {}, @request)
                allow(RestClient).to receive(:put).and_return(response)

                redirect = @api.update_proxy_redirect("test_port", {})
                expect(redirect).to be_a Hash
            end
        end

        describe "remove_proxy_redirect" do
            it "Removes all URL redirection rules" do
                json_response = load_file("generic.json")
                net_http_resp = Net::HTTPResponse.new(1.0, 200, 'OK')

                response = RestClient::Response.create(json_response, net_http_resp, {}, @request)
                allow(RestClient).to receive(:delete).and_return(response)

                redirect = @api.remove_proxy_redirect("test_port")
                expect(redirect).to be_a Hash
            end
        end

        describe "add_proxy_retry_count" do
            it "Setting the retry count" do
                json_response = load_file("generic.json")
                net_http_resp = Net::HTTPResponse.new(1.0, 200, 'OK')

                response = RestClient::Response.create(json_response, net_http_resp, {}, @request)
                allow(RestClient).to receive(:post).and_return(response)

                retry_count = @api.add_proxy_retry_count("test_port", {})
                expect(retry_count).to be_a Hash
            end
        end

        describe "remove_proxy_dns_cache" do
            it "Empties the Cache" do
                json_response = load_file("generic.json")
                net_http_resp = Net::HTTPResponse.new(1.0, 200, 'OK')

                response = RestClient::Response.create(json_response, net_http_resp, {}, @request)
                allow(RestClient).to receive(:delete).and_return(response)

                cache = @api.remove_proxy_dns_cache("test_port")
                expect(cache).to be_a Hash
            end
        end

    end
end