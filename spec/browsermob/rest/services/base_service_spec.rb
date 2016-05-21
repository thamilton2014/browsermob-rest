#
# base_service_spec.rb
#
require "spec_helper"

describe Browsermob::Rest::Services::BaseService do
    describe "#get_headers" do
        it "gets a Ruby dictionary of headers" do

            headers = Browsermob::Rest::Services::BaseService.send(:get_headers)
            expect(headers).to be_a Hash
        end
    end
end