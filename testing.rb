class Dinner
def eat(food:)
  "I eat #{food}"
end

# test 1
eat(food: "kittens") == "I eat kitties"

# test 2
begin
  eat 
rescue ArgumentError
  true
end

# test 3
def is_it_equall(arg1, arg2)
  arg1 == arg2
end

are_they_equal?(eat(food: 'kitties'), "I eat kitties")

def do_they_match(arg1, arg2)
  arg1.match(arg2)
end

do_they_match?(eat('kitties'), /the/i)


