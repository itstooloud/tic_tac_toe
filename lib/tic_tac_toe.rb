=begin
	
Build a tic-tac-toe game on the command line where two human players can play against each other and the board is displayed in between turns.

    Think about how you would set up the different elements within the game... What should be a class? Instance variable? Method? A few minutes of thought can save you from wasting an hour of coding.
    Build your game, taking care to not share information between classes any more than you have to.
    Post your solution below, then check out the example solution provided.

	
=end



class Player

	def initialize
		@name = "X"
	end

		
end



class Game

	attr_accessor :grid

	def initialize

		@grid = ("1".."9").to_a
		
	end

	def spot_is_taken?(spot)
		
		if (@grid[spot-1] == "X" || @grid[spot-1] == "O") 
			return true
		else
			return false
		end
	
	end



	def update_grid(player, move)

		position = move - 1 
		
				@grid.delete_at(position)
				@grid.insert(position, player)
				
	end


	def is_winner? (player)

			scenarios = []
			
			#across win scenarios

			a1 = @grid[0] + @grid[1] + @grid[2]
			a2 = @grid[3] + @grid[4] + @grid[5]
			a3 = @grid[6] + @grid[7] + @grid[8]

			scenarios.push(a1.to_s, a2.to_s, a3.to_s)
			
			#down win scenarios

			d1 = @grid[0] + @grid[3] + @grid[6]
			d2 = @grid[1] + @grid[4] + @grid[7]
			d3 = @grid[2] + @grid[5] + @grid[8]

			scenarios.push(d1.to_s, d2.to_s, d3.to_s)

			#diagonal win scenarios

			diag1 = @grid[0] + @grid[4] + @grid[8]
			diag2 = @grid[6] + @grid[4] + @grid[2]

			scenarios.push(diag1.to_s, diag2.to_s)

			if scenarios.include? player * 3
				true
			else
				false
			end

	end

	def is_draw?

		if @grid.join.to_s.scan(/\d/).empty?
			true
		else
			false
		end



	end

	def print_grid

			l = "----------"
			grid_display = []

			@grid.each do |i|
				if ("1".."9").include? i
					grid_display << " "
				else
					grid_display << i
				end
			end

			puts "\n"

			
			puts grid_display[0..2].join(" | ") + "\n" + l + "\n"+ grid_display[3..5].join(" | ") + "\n" + l + "\n" + grid_display[6..8].join(" | ")


			puts "\n"


	end

	def switch_players(player)

		if player == "X"
			return "O"
		elsif player == "O"
			return "X"
		end
			
	end

	def get_move(player)

		puts "What is your move, Player #{player} (1-9)?  >> "
		move = gets.chomp.to_i

		while (move > 9 || move < 1)

			puts "I'm sorry, that selection is out of bounds!"
			puts "What is your move, Player #{player} (1-9)?  >> "
			move = gets.chomp.to_i
		end
		while spot_is_taken?(move) 
			puts "I'm sorry, That spot is taken!"
			puts "What is your move, Player #{player} (1-9)?  >> "
			move = gets.chomp.to_i
		end
		return move

		
	end



	def play_game(player)

		
		over = false
		print_grid

		until over  

			move = get_move(player)
			
			update_grid(player, move)
				
			print_grid

						if is_winner? (player)

							puts "GAME OVER! YOU WIN, #{player}!"
							over = true
							break
						end
			
						if is_draw?
							puts "It's a DRAW!"
							over = true
						end

			player = switch_players(player)

		end

	end

end

