require 'date'
require 'timers'

class Bird
  attr_accessor :name, :type

  def initialize
    @name = nil
    @type = 1
    @health = 100
    @birthday = nil
    @energy = 100 # golod == 0
    @angry = 1
    @live = false
    @birds_type = ['Red Bird', 'Blue Birds',
                   'Yellow Bird ', 'Black Bird ',
                   'White Bird', 'Boomerang Bird',
                   'Big Brother Bird', 'Orange Bird',
                   'Pink Bird', 'Grey Bird']
  end

  def main_work
    puts 'Please, select your choice'
    case gets.to_i
    when 1 then bird_born
    when 2 then show_bird_status if alive?
    when 3 then bird_age if alive?
    when 4 then feed if alive?
    when 5 then fly if alive?
    when 6 then needs if alive?
    when 0 then exit
    else puts "I don't know what to do"
    end
  end

  def help
    puts 'Tamagochi v1.0 Beta "Birds"'
    puts '------------Menu-------------'
    puts '1 - create your bird'
    puts "2 - show bird's status"
    puts "3 - show bird's age"
    puts '4 - feed your bird'
    puts '5 - let the bird flight'
    puts '6 - needs'
    puts "0 - exit"
  end

  def bird_born
    if alive?
      puts 'Bird have allready born'
    else
      puts "Bird's name:"
      @name = gets.chomp
      puts "Bird's type (number):"
      t = gets
      @type = t.to_i
      @birthday = Time.now.hour
      @live = true
      timer(5)
      puts "\nBird #{@name} just born"
    end
  end

  def bird_age
    puts Time.now.hour - @birthday
  end

  def show_bird_status
    puts "Bird's name #{@name}"
    puts "Bird's type #{@birds_type[@type]}"
    puts "Bird's health #{@health}"
    puts "Bird's birthday #{bird_age.to_i}"
    puts "Bird's energy #{@energy}"
    puts "Bird's angry #{@angry}"
  end

  def needs
    puts "#{@name} wants eat!  (#{@energy}%)" if hungry?
    puts "#{@name} eats a lot and becomes a fatty, so can not fly  (#{@energy}%)" if overfed?
  end

  def feed
    if overfed?
      puts "#{@name} can not eat anymore, it is fat;)"
    else
      @energy += 33
      puts "#{@name} eating..."
      timer(5)
      puts('thank you')
    end
  end

  def fly # fly to expend energy
    if hungry?
      puts "#{@name} can not fly, it is hungry;("
    else
      @energy -= 10
      puts "#{@name} flies..."
      timer(5)
      puts('pleased')
    end
  end

  private

  def hungry?
    @energy <= 5
  end

  def overfed? # eats to much
    @energy >= 100
  end

  def alive?
    if @live
      true
    else
      puts 'bird not a live'
      false
    end
  end

  def timer(n)
    timers = Timers::Group.new
    timers.now_and_every(1) { print '.' }
    n.times { timers.wait }
  end
end

b = Bird.new
b.help
loop do
  b.main_work
end
