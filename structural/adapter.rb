# Change data in required format 

class User
  attr_reader :id, :first_name, :last_name, :email

  def initialize
    @id = 1
    @first_name = "Hemangini"
    @last_name = "Gohel"
    @email = "hemangini@gmail.com"
  end
end

class Stipe
  def self.subscription(email:)
    puts "Creating subscription for #{email}..."
  end

  def self.customer(fname:, lname:)
    puts "Creating customer for #{fname} #{lname}..."
  end
end

class StipeAdapter
  def self.subscribe(user)
    Stipe.subscription(email: user.email)
  end

  def self.register(user)
    Stipe.customer(
      fname: user.first_name,
      lname: user.last_name,
    )
  end
end

class Paypal
  def self.user(first_name:, last_name:)
    puts "Creating user #{first_name} #{last_name}..."
  end

  def self.subscribe(external_id:)
    puts "Creating subscription for ID: #{external_id}..."
  end
end

class PaypalAdapter
  def self.subscribe(user)
    Paypal.subscribe(external_id: user.id)
  end

  def self.register(user)
    Paypal.user(first_name: user.first_name, last_name: user.last_name)
  end
end

class Myapp
  def self.call(platform:, user:)
    platform.subscribe(user)
    platform.register(user)
  end
end

Myapp.call(platform: PaypalAdapter, user: User.new)
Myapp.call(platform: StipeAdapter, user: User.new)
