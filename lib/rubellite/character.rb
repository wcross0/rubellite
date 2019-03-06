class Character
  attr_reader :name, :race, :form, :level, :experience, :stats, :alive, :current_hp, :armor_class
  attr_writer :current_hp, :level, :experience

  XP_FACTOR = 2.80799

  def initialize(char_name = "Jan Doe", race = "Human", level = 1, experience = 0, alive = true, armor_class = 11)
    @name = char_name
    @race = race
    @form = race
    @level = level
    @experience = experience
    @alive = alive
    @stats = [
      :str,
      :dex,
      :con,
      :int,
      :wis,
      :cha
    ].map { |stat| [stat, 4.d.drop.sum] }.to_h
    @max_hp = 8 + (@stats[:con] - 10) / 2
    @current_hp = @max_hp
    @armor_class = armor_class
  end

  def reroll
    @stats = @stats.map { |stat, val| [stat, 4.d(6).drop.sum] }.to_h
  end

  def attack (target)
    dex_mod = (@stats[:dex] - 10) / 2
    rand(1..4) if rand(1..20) + dex_mod >= target.armor_class
  end

  def rename(new_name)
    @name = new_name
  end

  def transform(form = @race)
    @form = form
  end

  def xp_gain(n)
    @experience += n
    level_up?
  end

  def level_up?
    if @experience >= @level ** XP_FACTOR
      @level += 1
      level_up?
    end
  end

  def xp_to_next_level
    (@level ** XP_FACTOR - @experience).ceil
  end
end