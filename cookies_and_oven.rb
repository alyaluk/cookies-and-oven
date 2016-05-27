# Answer These Questions:

# - What are essential classes?
# - What attributes will each class have?
# - What interface will each class provide?
# - How will the classes interact with each other?
# - Which classes will inherit from others, if any?

$time = 0

# Your code here

class Cookies

  def initialize(cookie_type)

    case cookie_type
    when 1
      type = choc_chip
    when 2
      type = cornflakes
    end

    @name = type[0]
    @baking_time = type[1]

  end

  def get_baking_time
    @baking_time
  end

  def get_cookie_name
    @name
  end

  def choc_chip
    info = ["Chocolate Chip Cookies", 30]
  end

  def cornflakes
    info = ["Cornflakes Cookies", 15]
  end
end

class Ovens

  def initialize
    @cookie_list = []
  end

  def status(duration, baking_time) # when baking time run, if not ready to burnt

    time_remaining = baking_time - $time
    if time_remaining > 15
      return "doughy"
    elsif time_remaining > 5 and time_remaining < 16
      return "almost ready"
    elsif time_remaining > -6 and time_remaining < 6
      return "ready"
    elsif time_remaining < -5
      return "burned"
    end
  end

  def add_cookie(cookie)
    @cookie_list << cookie
  end

  def rem_cookie(cookie)
    @cookie_list.delete(cookie)
  end

  def get_cookie_list
    @cookie_list
  end

end


class Bakery

  def menu
    selection = 0
    print "\n\n"
    puts "+=+=+=+=+=+=+=+=+=+=+=+=+=+=+="
    puts "   Welcome to I <3 Cookies"
    puts "+=+=+=+=+=+=+=+=+=+=+=+=+=+=+="
    print "\n"
    puts "Hello! What would you like to do:"
    puts "1. Bake new batch of cookies"
    puts "2. Check cookies in the oven"
    puts "3. Take out cookies from the oven"
    puts "4. Eat the cookies"
    print "\nYour choice number: "
    selection = Integer(gets.chomp)
    while selection < 1 or selection > 4 do
      print "\nPlease enter 1, 2, 3 or 4"
      print "\nYour choice number: "
      selection = Integer(gets.chomp)
    end
    selection
  end

  def select_cookie
    print "\nPlease select which cookie to bake:\n"
    puts "1. Chocolate Chip"
    puts "2. Cornflakes Cookies"
    print "\nYour choice number: "
    selection = Integer(gets.chomp)
    while selection < 1 or selection > 2 do
      print "\nPlease enter 1 or 2"
      print "\nYour choice number: "
      selection = Integer(gets.chomp)
    end
    selection
  end

  def duration

    print "\nHow long have the cookies been in the oven?"
    print "\nDuration (minutes): "
    duration = Integer(gets.chomp)

  end

end

new_baker = Bakery.new
selection = 0
cookie = []
cookie[0] = 0
cookie_counter = 0

while selection != 4 do
  selection = new_baker.menu

  case selection
  when 1
    cookie_to_bake = new_baker.select_cookie
    cookie_counter += 1
    cookie[cookie_counter] = Cookies.new(cookie_to_bake)
    the_oven = Ovens.new
    the_oven.add_cookie(cookie[cookie_counter])
    print "\n**** Your #{cookie[cookie_counter].get_cookie_name} are in the oven! ****"
    # prompt anymore cookies to bake?
    # store all cookies in oven
    # puts #{all cookies} are in the oven
  when 2
    if cookie_counter == 0
      puts "**** There are no cookies in the oven! ****"
    else
      duration = new_baker.duration
      $time += duration
      print "\n"
      for index in 1..cookie_counter
        cookie_status = the_oven.status(duration, cookie[index].get_baking_time)
        puts "#{index}. #{cookie[index].get_cookie_name} are #{cookie_status}!"
      end
      # list all cookies in the oven with status or duration left to be ready
    end
  when 3
    if cookie_counter == 0
      puts "**** There are no cookies in the oven! ****"
    else
      puts "Please select which cookie to take out:"
      for index in 1..cookie_counter
        puts "#{index}. #{cookie[index].get_cookie_name}"
      end
      print "\nYour choice number: "
      cookie_to_remove = Integer(gets.chomp)
      the_oven.rem_cookie(cookie[cookie_to_remove])
      cookie_counter -= 1
      print "\n**** Your #{cookie[cookie_to_remove].get_cookie_name} is out of the oven! ****\n"
      puts "Cookie(s) left in the oven: #{cookie_counter}"
      # print "\nOven upgrade in process. Please try again later."
      # promt which cookie would you like to take out
      # give cookie and status of cookie
    end
  when 4
    print "\nEnjoy your cookies! ^__^ \n"
  end
end