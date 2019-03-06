class Fight
  def initialize (player, monster)
    @player = player
    @monster = monster
  end

  def round
    until @player.current_hp < 1 || @monster.current_hp < 1
      @player.current_hp -= @monster.attack(@player) || 0
      @monster.current_hp -= @player.attack(@monster) || 0
      print "player: #{@player.current_hp}, monster: #{@monster.current_hp}\n\n"
    end
  end
end