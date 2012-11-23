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
		unless @x - 25 <= 0
			@x -= 2
		end
	end

	def right
		unless @x + 25 >= 800
			@x += 2
		end
	end

	def up
		unless @y - 25 <= 0
			@y -= 2
		end
	end

	def down
		unless @y + 25 >= 600
			@y += 2
		end
	end


end

Game.new.show