require 'spec_helper'
require 'tic_tac_toe'

describe Game do 

	before :each do
		@game = Game.new

	end
	
	describe "#initialize" do

		it "should initialize a game grid array" do
			expect(@game.grid).to be_an(Array)
		end

	end

	describe "#switch_players" do

		it "should return X for O" do
			expect(@game.switch_players('X')) == 'O'
		end

		it "should return O for X" do
			expect(@game.switch_players('O')) == 'X'
		end
	end



	
end