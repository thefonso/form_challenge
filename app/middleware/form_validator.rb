class FormValidator
  def initialize(app) # middleware needs this
    @app = app
  end
  # build test controller
  # research rack rspec
  # research object param
  # cucumber acceptance test
  # start server
  # curl request
  # parse response
  #
  def call(env)
    [200, {"Content-Type" => "text/plain"}, ['Hello World']]
  end
end
