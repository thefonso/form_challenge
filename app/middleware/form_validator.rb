require 'pp'

class FormValidator
 def initialize(app)
   @app = app
 end
 
 def call(env)  
   # if request_path = "form post" then do stuff...
   request = Rack::Request.new(env)
   # response = Rack::Response.new(["I HATE YOU WORLD"],200)

   
   # return request
   pp "HELLO THERE!!!!!!"
   # pp request # whole object
   # pp request.env["HTTP_VERSION"]
   pp request.env.fetch("rack.request.form_hash", {}).fetch("post", {})["name"]
   

   if request.env["REQUEST_PATH"] == '/'
     
     # look for specifc params field
     # do stuff for security check
     # then pass on to rails app
     # response = Rack::Response.new(["hello"],200)
     # pp env
     # return response
     p "Hi from inside rack!!!!!!!!!!!!!!"
     @app.call(env)
   else
     @app.call(env)
   end
   
 end
 
end