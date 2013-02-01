require 'pp'

class FormValidator
 def initialize(app)
   @app = app
 end

 def call(env)
   # request = Rack::Request.new(env)
   request = Rack::MockRequest.env_for("/")
   # return request
   # pp request # whole object
   # pp request.env["rack.request.form_hash"]
      age_value = request.env.fetch("rack.request.form_hash", {}).fetch("post", {})["age"]
      name_value = request.env.fetch("rack.request.form_hash", {}).fetch("post", {})["name"]
      title_value = request.env.fetch("rack.request.form_hash", {}).fetch("post", {})["title"]
      content_value = request.env.fetch("rack.request.form_hash", {}).fetch("post", {})["content"]
      pp "LOOK AT ME !!!!!!!!!!!!!!!!!"
      pp name_value
      pp title_value
      pp content_value
      pp age_value

      # if the form is not empty
   if request.env["rack.request.form_hash"] != nil

    # if name is empty send error
     if /\w/.match(name_value) == ""
      raise ActionController::RoutingError.new('Forgot to enter your name....hit the browser back button')
     elsif /\w/.match(title_value) == ""
      raise ActionController::RoutingError.new('Enter your title....hit the browser back button')
     elsif /\w/.match(content_value) == ""
      raise ActionController::RoutingError.new('Please enter some content....hit the browser back button')
     elsif /\d+/.match(age_value) == nil
       raise ActionController::RoutingError.new('Forgot to enter your age....hit the browser back button')
     end

     response = @app.call(env)
     return response
   else
     p "nil indicator here !!!!!!!"
     response = @app.call(env)
     return response
   end

 end
end
