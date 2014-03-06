class Player
  def play_turn(warrior)
    if warrior.feel(:backward).empty? == true && @rescue_count != 1
      warrior.walk!(:backward)
    elsif warrior.feel(:backward).empty? == false
      warrior.rescue!(:backward)
      @rescue_count = 1
    elsif warrior.feel.empty?
        if warrior.health <20
          if warrior.health<@health
            warrior.walk!
          else
            warrior.rest!
          end
        else
          warrior.walk!
        end
      else
        if warrior.feel.captive?
          warrior.rescue!
        else
          warrior.attack!
        end
      end
      @health = warrior.health
    end
end
