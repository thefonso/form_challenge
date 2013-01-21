class Post < ActiveRecord::Base
  attr_accessible :age, :content, :name, :title
  # TODO validate via rack instead
end
