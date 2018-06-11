# This is where the database connections stuff goes
# This is the MODEL
# i.e. where the data interacts with the software
# And where class methods are used e.g. Cheets.all
require 'pg'

class Peep
  attr_reader :peep, :created_at

  def initialize(peep, created_at)
    @peep = peep
    @created_at = created_at
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      # Connects to the database
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    # SQL to query the database
    result = connection.exec("SELECT peep, created_at FROM peeps ORDER BY created_at DESC")

    # mapping the output
    result.map { |peep| peep['peep'] }
    result.map { |peep| Peep.new(peep['peep'], peep['created_at']) }
  end

  def self.create(options)
    if ENV['ENVIRONMENT'] == 'test'
      # Connects to the database
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    # connection.exec("INSERT INTO peeps (peep) VALUES('#{options[:peep]}')")
    result = connection.exec("INSERT INTO peeps (peep) VALUES('#{options[:peep]}') RETURNING peep, created_at")
    Peep.new(result.first['peep'], result.first['created_at'])
  end

end
