class Mode

  def self.attack(hero1,hero2)
    heroes = [hero1,hero2]
    heroes = heroes.shuffle
    hero = heroes.pop
    opponent = heroes.pop
    hero.dmg = hero.critical - opponent.armor
    if hero.dmg > 0
      opponent.hp -= hero.dmg
    end
    puts("#{opponent.name} was attacked. HP is now #{opponent.hp}.")
  end

end

class DeathMatch < Mode

  def begin(hero,opponent)
    5.times{Mode.attack(hero,opponent)}
  end

end


class Arena

  def self.duel(hero1,hero2,mode)
    mode.begin(hero1,hero2)
  end



end

class Hero

  attr_accessor :hp,:armor,:dmg
  attr_reader :name,:crit

end

class Warrior < Hero

  def initialize
    @hp = 100
    @armor = 25
    @dmg = 25
    @name = "Warrior"
    @crit = 100
  end

  def critical
    Dice.chance50(dmg,crit)
  end

end

class Healer < Hero

  def initialize
    @hp = 60
    @armor = 0
    @dmg = 5
    @name = "Healer"
    @crit = 20
  end

  def critical
    Dice.chance25(dmg,crit)
  end

end

class Mage < Hero

  def initialize
    @hp = 40
    @armor = 0
    @dmg = 100
    @name = "Mage"
    @crit = 125
  end

  def critical
    Dice.chance25(dmg,crit)
  end


end

class Tank < Hero

  def initialize
    @hp = 100
    @armor = 100
    @dmg = 0.5
    @name = "Tank"
    @crit = 50
  end

  def critical
    Dice.chance50(dmg,crit)
  end


end

class Dice

  def self.chance50(dmg,crit)
    n = rand(1..2)
    if n == 1
      dmg + crit
    else
      dmg
    end
  end

  def self.chance25(dmg,crit)
    n = rand(1..4)
    if n == 1
      dmg + crit
    else
      dmg
    end
  end

end

w = Warrior.new
h = Healer.new
m = Mage.new
t = Tank.new

d = DeathMatch.new

Arena.duel(w,h,d)
Arena.duel(m,t,d)
Arena.duel(m,h,d)
Arena.duel(w,t,d)
