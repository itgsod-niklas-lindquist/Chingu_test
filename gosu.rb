require 'chingu'

class Game < Chingu::Window

	#constructor
	def initialize
		super
		self.input = {esc: :exit}
		@player = Player.create
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
			holding_down: :down
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


end

Game.new.show