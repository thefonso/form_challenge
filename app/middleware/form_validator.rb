require 'pp'

class FormValidator
 def initialize(app)
   @app = app
 end

 # display form post data
 
 def call(env)
   request = Rack::Request.new(env)
   response = Rack::Response.new(["I HATE YOU WORLD"],200)
   p request.params
   return response
 end
 
end