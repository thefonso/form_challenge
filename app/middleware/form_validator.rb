require 'pp'

class FormValidator
  def initialize(app)
    @app = app
  end

  def call(env)
    request = Rack::Request.new(env)

    items = [age,name,title,content]
    for items.each do |thing|
      # how to abstract this?
      field_name = "age"
      formbox_value = request.env.fetch("rack.request.form_hash", {}).fetch("post", {})[field_name]

      # How am I calling the YML file?

      pp "LOOK AT ME !!!!!!!!!!!!!!!!!"
      pp formbox_value

      # TODO abstract these things out so that you can create a hash and then serializ the Hash.
      # You want to eventually pull all this out and offer it as middleware anyone can use.
      # part 1 - kill duplication
      # part 2 - pull things out into yml file
      # if the form is not empty
      if request.env["rack.request.form_hash"] != nil

        # if name is empty send error
        if formbox_value == ""
          raise ActionController::RoutingError.new('Forgot to enter your #{field_name}....hit the browser back button')
        elsif formbox_value= /\d+/.match(age_value) == nil
          raise ActionController::RoutingError.new('Forgot to enter your age....hit the browser back button')
        end

        @app.call(env)

      else
        p "nil indicator here !!!!!!!"
        @app.call(env)
      end
    end
  end
end
