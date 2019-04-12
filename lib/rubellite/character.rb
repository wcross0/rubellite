# Character is a funzies class for fiddling with.
class Character
  attr_reader :name, :race, :form, :level, :experience, :stats, :alive,
              :current_hp, :armor_class, :max_hp
  attr_writer :current_hp, :level, :experience

  XP_FACTOR = 2.80799

  def initialize(
    char_name = 'Jan Doe',
    race = 'Human',
    level = 1,
    experience = 0,
    alive = true,
    armor_class = 11
  )
    @name = char_name
    @race = race
    @form = race
    @level = level
    @experience = experience
    @alive = alive

    @stats = %i[str dex con int wis cha]
    reroll
    @stats.keys.each do |stat|
      define_singleton_method(stat.to_s) { @stats[stat.to_sym] }
    end

    @max_hp = 8 + (con - 10) / 2
    @current_hp = @max_hp
    @armor_class = armor_class
  end

  def reroll
    @stats = @stats.map { |stat, _val| [stat, 4.d(6).drop.sum] }.to_h
  end

  def attack(target)
    dex_mod = (dex - 10) / 2
    rand(1..20) + dex_mod >= target.armor_class ? rand(1..4) : 0
  end

  def rename(new_name)
    @name = new_name
  end

  def transform(form = @race)
    @form = form
  end

  def xp_gain(amount)
    @experience += amount
    level_up?
  end

  def level_up?
    if @experience >= @level**XP_FACTOR
      @level += 1
      level_up?
    end
  end

  def xp_to_next_level
    (@level**XP_FACTOR - @experience).ceil
  end
end
