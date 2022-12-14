# Observer checks for change of state of any object and notify another object

require "observer"

class Prize
  def initialize
    puts "Prize intialized"
  end

  def update
    puts "Prize updated"
  end
end

class UnlockModule
  def initialize
    puts "UnlockModule intialized"
  end
  def update
    puts "Module unlocked"
  end
end

class UserScore
  include Observable

  attr_reader :user_id
  attr_reader :score

  def initialize(user_id, score)
    @user_id = user_id
    @score = score
    @observers = []
  end

  def score=(new_score)
    @score = new_score
    notify_observers
  end

  def add_observer(observer)
    @observers << observer
  end

  def delete_observer(observer)
    @observers.delete(observer)
  end

  def notify_observers
    @observers.each do |observer|
      observer.update
    end
  end
end

user_score = UserScore.new("2", 30.25)

prize = Prize.new
user_score.add_observer(prize)

unlock_module = UnlockModule.new
user_score.add_observer(unlock_module)

user_score.score = 35000.0
