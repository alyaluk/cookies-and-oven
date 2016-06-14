# Answer These Questions:

# - What are essential classes?
# - What attributes will each class have?
# - What interface will each class provide?
# - How will the classes interact with each other?
# - Which classes will inherit from others, if any?


class Cookies
	attr_accessor :minutes, :type

	def initialize(type, duration)
		@type = type
		@duration = duration.to_i
		@minutes = 0
		@time = @duration + 1
	end
	def time_down
		until @minutes == @duration
			puts "The cookies are done!" if self.cooked? == true
			puts "Oh no! The cookies are burnt!" if self.burnt? == true
			@minutes += 1
			@time -= 1
			output = "#{@time} minutes left." + "\r"
			print output
			$stdout.flush
			sleep(1)
		end
	end
	def cooked?
		if @type == "chocolate"
			return true if @minutes == 20
		elsif @type == "butterscotch"
			return true if @minutes == 15
		end
	end
	def burnt?
		return true if @minutes == 30
	end
	def bake
		puts "The cookies are in the oven and doughy."
		self.time_down
	end
end

puts "What type of cookies would you like to cook? (chocolate/butterscotch)"
type = gets.chomp
puts "How many minutes do you want to bake it for?"
duration = gets.chomp.to_i
puts ""
cookies = Cookies.new(type, duration)
cookies.bake