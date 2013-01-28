require 'pp'

class FormValidator
 def initialize(app)
   @app = app
 end

 def not_found
   raise ActionController::RoutingError.new('Forgot to enter your age....hit the browser back button')
 end

 def call(env)
   request = Rack::Request.new(env)

   # return request
   # pp request # whole object
   # pp request.env["rack.request.form_hash"]
    pp "HELLO !!!!!!!!!!!!!!!!!!!"
      age_value = request.env.fetch("rack.request.form_hash", {}).fetch("post", {})["age"]
      pp age_value
      pp /\d+/.match(age_value)
   # if the form is not empty
   if request.env["rack.request.form_hash"] != nil

     # if age field is not empty
     if /\d+/.match(age_value) == nil
        #redirect to 404 error
       not_found
     else

     end
     # then pass on to rails app
     @app.call(env)

   else
     p "nil indicator here !!!!!!!"
     @app.call(env)
   end

 end
end
