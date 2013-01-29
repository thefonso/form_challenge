require 'pp'

class FormValidator
 def initialize(app)
   @app = app
 end

 def call(env)
   request = Rack::Request.new(env)

   # return request
   # pp request # whole object
   # pp request.env["rack.request.form_hash"]
      age_value = request.env.fetch("rack.request.form_hash", {}).fetch("post", {})["age"]
      name_value = request.env.fetch("rack.request.form_hash", {}).fetch("post", {})["name"]
      title_value = request.env.fetch("rack.request.form_hash", {}).fetch("post", {})["title"]
      content_value = request.env.fetch("rack.request.form_hash", {}).fetch("post", {})["content"]
      # if the form is not empty
   if request.env["rack.request.form_hash"] != nil

    # if name is empty send error
     if name_value == nil
      raise ActionController::RoutingError.new('Forgot to enter your name....hit the browser back button')
     elsif title_value == nil
      raise ActionController::RoutingError.new('Enter your title....hit the browser back button')
     elsif content_value == nil
      raise ActionController::RoutingError.new('Please enter some content....hit the browser back button')
     elsif /\d+/.match(age_value) == nil
       raise ActionController::RoutingError.new('Forgot to enter your age....hit the browser back button')
     end

     @app.call(env)

   else
     p "nil indicator here !!!!!!!"
     @app.call(env)
   end

 end
end
