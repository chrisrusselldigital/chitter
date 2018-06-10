# This is where the database connections stuff goes
# This is the MODEL
# i.e. where the data interacts with the software
# And where class methods are used e.g. Cheets.all
require 'pg'

class Peep

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      # Connects to the database
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    # SQL to query the database
    result = connection.exec("SELECT * FROM peeps")

    # mapping the output
    result.map { |peep| peep['peep']}
  end

end
