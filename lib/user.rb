require 'pg'

class User
  attr_reader :id, :email, :password

  def initialize(id, email, password)
    @id = id
    @email = email
    @password = password
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      # Connects to the database
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.query("SELECT * FROM users")
    result.map { |user| User.new(user['id'], user['email'], user['password'])}
  end

  def self.find(id)
    if ENV['ENVIRONMENT'] == 'test'
      # Connects to the database
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    return nil unless id
    result = connection.query("INSERT INTO users (email, password) VALUES('#{options[:email]}', '#{options[:password]}') RETURNING id, email, password;")
    User.new(result[0]['id'], result[0]['email'], result[0]['password'])
  end

end
