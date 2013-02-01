require_relative '../spec_helper'
require_relative '../../app/middleware/form_validator'



describe FormValidator do
  let(:env) {Rack::MockRequest.env_for('/')}
  let(:formvalidator) {FormValidator.new}

  def request!(other_env)
    @status, @headers, @response = Rails.application.call(env.merge(other_env))
  end

  xit 'should exist' do
    # TODO how to mock this .call method? Rack::MockRequest?
    #
    fake_env = 
    form = formvalidator.call(fake_env)
    form.should == nil
  end
  it "redirects to address sans www" do
    request!("HTTP_HOST" => "www.example.com")
    @status.should eql(301)
    @headers["Location"].should eql("http://example.com")
  end
end
