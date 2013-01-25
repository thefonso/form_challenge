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
   # pp request # whole object
   # pp request.env["rack.request.form_hash"]
   # pp request.env.fetch("rack.request.form_hash", {}).fetch("post", {})["name"]
   

   if request.env["rack.request.form_hash"] != nil
     
     # look for specifc params field
     pp request.env.fetch("rack.request.form_hash", {}).fetch("post", {})["name"]

     # do stuff for security check
     
     
     # then pass on to rails app
     @app.call(env)
   else
     p "nil indicator here !!!!!!!"
     @app.call(env)
   end
   
 end
 
end