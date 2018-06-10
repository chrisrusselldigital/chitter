require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (peep) VALUES ('Hello world.');")
      connection.exec("INSERT INTO peeps (peep) VALUES ('2nd peep!');")
      # setup
      expected_peeps = [
        '2nd peep!',
        'Hello world.'
      ]
      expect(Peep.all).to eq expected_peeps
    end

    it 'creates a new peep' do
      Peep.create(peep: "A new peep.")
      expect(Peep.all).to include 'A new peep.'
    end

  end
end
