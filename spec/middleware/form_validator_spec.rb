require_relative '../../app/middleware/form_validator'
require 'rack/test'


class SampleMiddleware
    def initialize(app)
        @app = app
    end
    def call(env)
        request = Rack::Request.new(env)
        request.session['hello'] = 'world'
        @app.call(env)
    end
end
describe SampleMiddleware do
    include Rack::Test::Methods
 
    let(:inner_app) do
        lambda { |env| [200, {'Content-Type' => 'text/plain'}, 'All good!'] }
    end
 
    let(:app) { SampleMiddleware.new(inner_app) }
 
    it "adds hello:world to session" do
        get "/"
        last_request.session['hello'].should == 'world'
    end
 
    it "makes no change to response status" do
        get "/"
        last_response.should be_ok
    end
end

