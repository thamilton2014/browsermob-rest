#
# proxy_service_spec.rb
#
require "spec_helper"

describe Browsermob::Rest::Services::ProxyService do

    before(:each) do
        @request = double('http request', user: nil, password: nil, url: 'http://example.com')
    end

    describe "get_proxies" do
        it "" do
            json_response = load_file("generic.json")
            net_http_resp = Net::HTTPResponse.new(1.0, 200, 'OK')

            response = RestClient::Response.create(json_response, net_http_resp, {}, @request)
            allow(RestClient).to receive(:get).and_return(response)

            proxies = Browsermob::Rest::Services::ProxyService.get_proxies()
            expect(proxies).to be_a Hash
        end
    end

    describe "remove_proxy" do
        it "" do
            json_response = load_file("generic.json")
            net_http_resp = Net::HTTPResponse.new(1.0, 200, 'OK')

            response = RestClient::Response.create(json_response, net_http_resp, {}, @request)
            allow(RestClient).to receive(:delete).and_return(response)

            proxy = Browsermob::Rest::Services::ProxyService.remove_proxy("test_port")
            expect(proxy).to be_a Hash
        end
    end

    describe "update_proxy_limit" do
        it "" do
            json_response = load_file("generic.json")
            net_http_resp = Net::HTTPResponse.new(1.0, 200, 'OK')

            response = RestClient::Response.create(json_response, net_http_resp, {}, @request)
            allow(RestClient).to receive(:put).and_return(response)
            
            limit = Browsermob::Rest::Services::ProxyService.update_proxy_limit("test_port", {})
            expect(limit).to be_a Hash
        end
    end

    describe "get_proxy_limit" do
        it "" do
            json_response = load_file("generic.json")
            net_http_resp = Net::HTTPResponse.new(1.0, 200, 'OK')

            response = RestClient::Response.create(json_response, net_http_resp, {}, @request)
            allow(RestClient).to receive(:get).and_return(response)
            
            limit = Browsermob::Rest::Services::ProxyService.get_proxy_limit("test_port")
            expect(limit).to be_a Hash
        end
    end

    describe "add_proxy_headers" do
        it "" do
            json_response = load_file("generic.json")
            net_http_resp = Net::HTTPResponse.new(1.0, 200, 'OK')

            response = RestClient::Response.create(json_response, net_http_resp, {}, @request)
            allow(RestClient).to receive(:post).and_return(response)
            
            headers = Browsermob::Rest::Services::ProxyService.add_proxy_headers("test_port", {})
            expect(headers).to be_a Hash
        end
    end

    describe "add_proxy_hosts" do
        it "" do
            json_response = load_file("generic.json")
            net_http_resp = Net::HTTPResponse.new(1.0, 200, 'OK')

            response = RestClient::Response.create(json_response, net_http_resp, {}, @request)
            allow(RestClient).to receive(:post).and_return(response)
            
            hosts = Browsermob::Rest::Services::ProxyService.add_proxy_hosts("test_port", {})
            expect(hosts).to be_a Hash
        end
    end

    describe "add_proxy_authentication" do
        it "" do
            json_response = load_file("generic.json")
            net_http_resp = Net::HTTPResponse.new(1.0, 200, 'OK')

            response = RestClient::Response.create(json_response, net_http_resp, {}, @request)
            allow(RestClient).to receive(:post).and_return(response)

            auth = Browsermob::Rest::Services::ProxyService.add_proxy_authentication("test_port", "test_domain", {})
            expect(auth).to be_a Hash       
        end
    end

    describe "update_proxy_wait" do
        it "" do
            json_response = load_file("generic.json")
            net_http_resp = Net::HTTPResponse.new(1.0, 200, 'OK')

            response = RestClient::Response.create(json_response, net_http_resp, {}, @request)
            allow(RestClient).to receive(:put).and_return(response)
            
            wait = Browsermob::Rest::Services::ProxyService.update_proxy_wait("test_port", {})
            expect(wait).to be_a Hash
        end
    end

    describe "update_proxy_timeout" do
        it "" do
            json_response = load_file("generic.json")
            net_http_resp = Net::HTTPResponse.new(1.0, 200, 'OK')

            response = RestClient::Response.create(json_response, net_http_resp, {}, @request)
            allow(RestClient).to receive(:put).and_return(response)

            timeout = Browsermob::Rest::Services::ProxyService.update_proxy_timeout("test_port", {})
            expect(timeout).to be_a Hash
        end
    end

    describe "update_proxy_redirect" do
        it "" do
            json_response = load_file("generic.json")
            net_http_resp = Net::HTTPResponse.new(1.0, 200, 'OK')

            response = RestClient::Response.create(json_response, net_http_resp, {}, @request)
            allow(RestClient).to receive(:put).and_return(response)
            
            redirect = Browsermob::Rest::Services::ProxyService.update_proxy_redirect("test_port", {})
            expect(redirect).to be_a Hash
        end
    end

    describe "remove_proxy_redirect" do
        it "" do
            json_response = load_file("generic.json")
            net_http_resp = Net::HTTPResponse.new(1.0, 200, 'OK')

            response = RestClient::Response.create(json_response, net_http_resp, {}, @request)
            allow(RestClient).to receive(:delete).and_return(response)
            
            redirect = Browsermob::Rest::Services::ProxyService.remove_proxy_redirect("test_port")
            expect(redirect).to be_a Hash
        end
    end

    describe "add_proxy_retry_count" do
        it "" do
            json_response = load_file("generic.json")
            net_http_resp = Net::HTTPResponse.new(1.0, 200, 'OK')

            response = RestClient::Response.create(json_response, net_http_resp, {}, @request)
            allow(RestClient).to receive(:post).and_return(response)
            
            count = Browsermob::Rest::Services::ProxyService.add_proxy_retry_count("test_port", {})
            expect(count).to be_a Hash
        end
    end

    describe "remove_proxy_dns_cache" do
        it "" do
            json_response = load_file("generic.json")
            net_http_resp = Net::HTTPResponse.new(1.0, 200, 'OK')

            response = RestClient::Response.create(json_response, net_http_resp, {}, @request)
            allow(RestClient).to receive(:delete).and_return(response)

            cache = Browsermob::Rest::Services::ProxyService.remove_proxy_dns_cache("test_port")
            expect(cache).to be_a Hash   
        end
    end

end