class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end

  def self.winner(player1, player2)
    if (player1[1]=~/[RPSrps]/ && player2[1]=~/[RPSrps]/)
      player1Strategy = player1[1]
      player2Strategy = player2[1]
      winner = player1
      case player1Strategy
        when "R"
          if (player2Strategy == "P")
            winner = player2
          end
        when "P"
          if (player2Strategy == "S")
            winner = player2
          end
        when "S"
          if (player2Strategy == "R")
            winner = player2
          end
        else
          #No other cases possible 
      end
      return winner
    else
      raise RockPaperScissors::NoSuchStrategyError
    end
  end

  def self.tournament_winner(tournament)
   if (tournament[0][1] =~/[RPS]/)
    return winner(tournament[0], tournament[1])
   else
    competitor1 = tournament_winner(tournament[0])
    competitor2 = tournament_winner(tournament[1])
    return winner(competitor1, competitor2)
   end
  end   
end


print RockPaperScissors.tournament_winner([
  [
    [ ["Armando", "P"], ["Dave", "S"] ],      
    [ ["Richard", "R"], ["Michael", "S"] ]
  ],
  [
    [ ["Allen", "S"], ["Omer", "P"] ],
    [ ["David E.", "R"], ["Richard X.", "P"] ]
  ]
])