require 'date'
require 'timers'

class Bird
  attr_accessor :name

  def initialize
    @name = nil
    @health = 100
    @birthday = nil
    @energy = 100 # golod == 0
    @angry = 1
    @live = false
  end

  def make_choise
    puts 'Please, select your choice'
    i = gets.to_i
    i
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
    puts '0 - exit'
  end

  def bird_born
    if alive?
      puts 'Bird have allready born'
    else
      puts "Bird's name:"
      @name = gets.chomp
      @birthday = Time.now.sec
      @live = true
      timer(5)
      puts "\nBird #{@name} just born"
    end
  end

  def bird_age
    if alive?
      (Time.now.sec - @birthday).abs
    else 0
    end
  end

  def show_bird_status
    return unless alive?
    puts "Bird's name #{@name}"
    puts "Bird's health #{@health}"
    puts "Bird's birthday #{bird_age}"
    puts "Bird's energy #{@energy}"
    puts "Bird's angry #{@angry}"
  end

  def needs
    return unless alive?
    puts "#{@name} wants eat!  (#{@energy}%)" if hungry? && alive?
    puts "#{@name} eats a lot, so can not fly  (#{@energy}%)" if overfed?
  end

  def feed
    return unless alive?
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
    return unless alive?
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
  case b.make_choise
  when 1 then b.bird_born
  when 2 then b.show_bird_status
  when 3 then puts b.bird_age
  when 4 then b.feed
  when 5 then b.fly
  when 6 then b.needs
  when 0 then exit
  else
    puts "I don't know what to do"
  end
end
