require_relative '../../app/middleware/form_validator'



describe FormValidator do
  let(:formval) {FormValidator.new}

  it 'should exist' do
    # TODO how to mock this .call method? Rack::MockRequest?
    #
    form = formval(ENV['age'])
    form.should == nil
  end
end
