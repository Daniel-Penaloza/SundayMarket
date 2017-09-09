require "rails_helper"

RSpec.describe ApplicationHelper, :type => :helper do
  describe "#check_url" do
    it "should return false if url does not have http or https" do
			website = "test-test.test.test"
			expect(check_url(website)).to eql(false)
		end
		it "should return true if url does have http" do
			website = "http://test-test.test.test"
			expect(check_url(website)).to eql(true)
		end
		it "should return true if url does have https" do
			website = "https://test-test.test.test"
			expect(check_url(website)).to eql(true)
		end
  end

  describe "#format_url" do
    it "should return the original url if it's in right format" do
			website = "http://test-test.test.test"
			expect(format_url(website)).to eq(website)
		end
		it "should append http:// in the original url" do
			website = "test-test.test.test"
			expect(format_url(website)).to eq("http://test-test.test.test")
    end
  end
end