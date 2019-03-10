class Player
  def play_turn(warrior)
    @health = warrior.health unless warrior.health
    @behind = 2 if @behind.nil?
    @temp = 2 if @temp.nil?
    @behind = @behind - 1

    if @behind < -3 and @behind > -7
      warrior.shoot!
    else
      if warrior.feel.empty?
        if warrior.health > 15 or under_attack?(warrior)
          if warrior.health < 8
            warrior.walk!(:backward)
          else
            warrior.walk!
          end
        else
          warrior.rest!
        end
      else
        if warrior.feel.wall?
          warrior.pivot!
        else
          if warrior.feel(:backward).captive?
            warrior.rescue(:backward)
          elsif warrior.feel.captive?
            warrior.rescue!
          else
            warrior.attack!
          end
        end

      end
    end
    @health = warrior.health
  end

  def under_attack?(warrior)
    warrior.health < @health
  end
end
