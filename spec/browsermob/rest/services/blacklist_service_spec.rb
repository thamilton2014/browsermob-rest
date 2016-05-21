#
# blacklist_service_spec.rb
#
require "spec_helper"

describe Browsermob::Rest::Services::BlacklistService do

    before(:each) do
        @request = double('http request', user: nil, password: nil, url: 'http://example.com')
    end

    describe "get_proxy_blacklist" do
        it "" do
            json_response = load_file("generic.json")
            net_http_resp = Net::HTTPResponse.new(1.0, 200, 'OK')

            response = RestClient::Response.create(json_response, net_http_resp, {}, @request)
            allow(RestClient).to receive(:get).and_return(response)

            list = Browsermob::Rest::Services::BlacklistService.get_proxy_blacklist("test_port")
            expect(list).to be_a Hash
        end
    end

    describe "update_proxy_blacklist" do
        it "" do
            json_response = load_file("generic.json")
            net_http_resp = Net::HTTPResponse.new(1.0, 200, 'OK')

            response = RestClient::Response.create(json_response, net_http_resp, {}, @request)
            allow(RestClient).to receive(:put).and_return(response)

            list = Browsermob::Rest::Services::BlacklistService.update_proxy_blacklist("test_port", {})
            expect(list).to be_a Hash
        end
    end

    describe "remove_proxy_blacklist" do
        it "" do
            json_response = load_file("generic.json")
            net_http_resp = Net::HTTPResponse.new(1.0, 200, 'OK')

            response = RestClient::Response.create(json_response, net_http_resp, {}, @request)
            allow(RestClient).to receive(:delete).and_return(response)

            list = Browsermob::Rest::Services::BlacklistService.remove_proxy_blacklist("test_port")
            expect(list).to be_a Hash
        end
    end

end