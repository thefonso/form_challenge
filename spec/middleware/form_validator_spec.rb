require_relative '../../app/middleware/form_validator'



describe FormValidator do
  let (:formvalidator) {FormValidator.new}
  it 'should exist' do
    # TODO how to mock this .call method? Rack::MockRequest?
    form = formvalidator.call()
    form.should == nil
  end
end
