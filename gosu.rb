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
		@x, @y = 350, 400
		@image = Gosu::Image["bullshit.psd"]  #Skeppet

	end

end

Game.new.show