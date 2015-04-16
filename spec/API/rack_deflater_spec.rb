require 'spec_helper'

describe Rack::Deflater do
  it "produces an identical eTag whether content is deflated or not" do
    get "/api/acme"
    response.headers["Content-Encoding"].should be_nil
    etag = response.headers["Etag"]
    content_length = response.headers["Content-Length"].to_i
    get "/api/acme", {}, { "HTTP_ACCEPT_ENCODING" => "gzip" }
    response.headers["Etag"].should == etag
    response.headers["Content-Length"].to_i.should_not == content_length
    response.headers["Content-Encoding"].should == "gzip"
  end
  it "deflates JSONP content" do
    get "/api/acme?callback=parseResponse", {}, { "HTTP_ACCEPT_ENCODING" => "deflate" }
    response.headers["Content-Encoding"].should == "deflate"
    inflated_response_body = Zlib::Inflate.new(-Zlib::MAX_WBITS).inflate(response.body.to_s)
    inflated_response_body.should == "parseResponse(...)"
  end
end