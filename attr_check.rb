module Checker
  def attr_checker (name, &block)

    if instance_eval(&block) == false
      #raise ArgumentError, "Invalid argument #{name}"
      puts "Invalid argument #{name}"
    else
      attr_accessor "#{name}".to_sym
      puts "Valid"
    end
  end
end

class Cat
  extend Checker
  attr_checker :legs do |n|
      n == 4
    end
  attr_checker :age do |n|
      n == 30
  end
end

garfield = Cat.new
garfield.age = 0
puts garfield.age
garfield.age = 30
puts garfield.age
garfield.legs = 4
puts garfield.legs