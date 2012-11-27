require 'chingu'

class Game < Chingu::Window

	#constructor
	def initialize
		super 640, 480
		self.input = {esc: :exit}
		@background_image = Bkimg.create
		@player = Player.create
		@target = []
		5.times { @target << Target.create}
	end

	def update
		super
		Laser.each_bounding_circle_collision(Target) do |laser, target|
		laser.destroy
		target.destroy
		end
	end

end

class Player < Chingu::GameObject

	#meta-contructor
	def setup
		@speed = 5
		@x, @y = 200, 400
		@image = Gosu::Image["bullshit.psd"]  #Skeppet
		self.input = {
			holding_left: :left,
			holding_right: :right,
			holding_up: :up,
			holding_down: :down,
			space: :fire
		}
	end

	def left
		unless @x - 15 <= 0
			@x -= @speed
		end
	end

	def right
		unless @x + 15 >= 800
			@x += @speed
		end
	end

	def up
		unless @y - 28 <= 0
			@y -= @speed
		end
	end

	def down
		unless @y + 15 >= 600
			@y += @speed	
		end
	end

	def fire
		Laser.create(x: self.x, y: self.y)
	end
end

class Laser < Chingu::GameObject
	has_traits :velocity, :collision_detection, :bounding_circle

	def setup
		@image = Gosu::Image["laser.png"]
		self.velocity_y = -10
	end
end

class Target < Chingu::GameObject
	has_traits :collision_detection, :bounding_circle

	def setup 
		@x = rand(800)
		@y = 100
		@image = Gosu::Image["target.png"]
	end
end

class Bkimg < Chingu::GameObject

	def setup
		@x = 640/2
		@y = 480/2
		@image = Gosu::Image["galaxy.jpg"]
	end
end

Game.new.show