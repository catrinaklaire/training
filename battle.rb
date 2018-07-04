class Arena

  def duel(hero1,hero2)
    heroes = [hero1,hero2]
    heroes = heroes.shuffle
    hero = heroes.pop
    opponent = heroes.pop
    hero.attack(opponent)
  end

end

class Hero

  attr_accessor :hp,:armor,:dmg,:name


  def attack(opponent)
    if dmg >= opponent.dmg
      opponent.hp -= dmg
      puts("#{opponent.name} is defeated. HP is now #{opponent.hp}.")
    else
      hp -= opponent.dmg
      puts("#{name} is defeated. HP is now #{hp}.")
    end
  end

end

class Warrior < Hero

  def initialize
    @hp = 100
    @armor = 25
    @dmg = 25
    @name = "Warrior"
  end

end

class Healer < Hero

  def initialize
    @hp = 60
    @armor = 0
    @dmg = 5
    @name = "Healer"
  end

end

class Mage < Hero

  def initialize
    @hp = 40
    @armor = 0
    @dmg = 100
    @name = "Mage"
  end

end

class Tank < Hero

  def initialize
    @hp = 100
    @armor = 100
    @dmg = 0.5
    @name = "Tank"
  end

end

w = Warrior.new
h = Healer.new
m = Mage.new
t = Tank.new

Arena.new.duel(w,h)
