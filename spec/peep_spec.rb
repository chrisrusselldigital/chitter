require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (peep) VALUES ('Hello world.');")
      connection.exec("INSERT INTO peeps (peep) VALUES ('2nd peep!');")
      # setup
      expected_peeps = [
        'Hello world.',
        '2nd peep!'
      ]
      expect(Peep.all).to eq expected_peeps
    end
  end
end
