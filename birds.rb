require 'date'
require 'timers'


class Bird
    attr_accessor :name, :type



    def initialize()
      @name = nil
      @type = 1
      @health = 100
      @birthday = nil
      @energy = 100 #голод == 0, ситий 100
      @angry = 1
      @life = false

      @birds_type = ["Red Bird" , "Blue Birds" ,
                    "Yellow Bird ", "Black Bird ",
                    "White Bird", "Boomerang Bird",
                    "Big Brother Bird", "Orange Bird",
                    "Pink Bird", "Grey Bird"]

    end

    def timer(n)
      timers = Timers::Group.new
      now_and_every_one_seconds = timers.now_and_every(1) { print "." }
      n.times { timers.wait }
    end

    def bird_born
      puts "Bird's name:"
      @name = gets
      puts "Bird's type (number):"
      t = gets
      @type = t.to_i
      @birthday = Time.now.hour
      @life = true
       #@birds_type[@type]
       timer(5)
      puts ' '
      puts "Bird #{@name} just born"
    end

    def bird_age
      Time.now.hour - @birthday
    end

    def show_bird_status
      if @life
      puts "Bird's name #{@name}"
      puts "Bird's type #{@birds_type[@type]}"
      puts "Bird's health #{@health}"
      puts "Bird's birthday #{bird_age.to_i}"
      puts "Bird's energy #{@energy}"
      puts "Bird's angry #{@angry}"
      puts "Bird's poo #{@poo}"
      puts "-----------------------------------------------"
      puts "#{@name} wants eat!  (#{@energy}%)" if hungry?
      puts "#{@name} eats a lot and becomes a fatty, so can not fly  (#{@energy}%)" if overfed?
     # puts "#{@name} скучает.  (#{@mood}%)" if bored?
     # puts "#{@name} хочет спать.  (#{@cheerfulness}%)" if sleepy?
      #puts "#{@name} плохо себя чуствует!  (#{@health}%)" if healthy?
      #puts "#{@name} воняет!  (#{@cleaness}%)" if clean?
      puts "-----------------------------------------------"

      else
        puts "Bird was not born yet, please call method bird_born"
      end
    end

    def feed # їсть щоб отримати енергію
        @energy +=33
        puts "#{@name} eat..."
      timer(5)
      puts("thank you")
    end

    def fly # літає щоб потратити енергію
      @energy -=10
      puts "#{@name} flies..."
      timer(5)
      puts("pleased")
    end

    def hungry?  # чи голодна пташка
      @energy <= 5
    end


    def overfed?  # чи не переїла
      @energy >= 100
    end


end

  b = Bird.new
  b.bird_born
  b.show_bird_status
b.feed
b.fly
b.show_bird_status
