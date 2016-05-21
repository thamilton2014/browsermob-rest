require "spec_helper"

describe Browsermob::Rest::Services::HarService do

    before(:each) do
        @request = double('http request', user: nil, password: nil, url: 'http://example.com')
    end

    describe "get_proxy_har" do
        it "" do
            json_response = load_file("generic.json")
            net_http_resp = Net::HTTPResponse.new(1.0, 200, 'OK')

            response = RestClient::Response.create(json_response, net_http_resp, {}, @request)
            allow(RestClient).to receive(:get).and_return(response)

            authorized_apps = Browsermob::Rest::Services::HarService.get_proxy_har("test_port")
            expect(authorized_apps).to be_a Hash
        end
    end

    describe "update_proxy_har" do
        it "" do
            json_response = load_file("generic.json")
            net_http_resp = Net::HTTPResponse.new(1.0, 200, 'OK')

            response = RestClient::Response.create(json_response, net_http_resp, {}, @request)
            allow(RestClient).to receive(:put).and_return(response)

            authorized_app = Browsermob::Rest::Services::HarService.update_proxy_har("test_port", {})
            expect(authorized_app).to be_a Hash
        end
    end

    describe "update_proxy_har_pageref" do
        it "" do 
            json_response = load_file("generic.json")
            net_http_resp = Net::HTTPResponse.new(1.0, 200, 'OK')

            response = RestClient::Response.create(json_response, net_http_resp, {}, @request)
            allow(RestClient).to receive(:put).and_return(response)

            authorized_app = Browsermob::Rest::Services::HarService.update_proxy_har_pageref("test_port", {})
            expect(authorized_app).to be_a Hash
        end
    end

end