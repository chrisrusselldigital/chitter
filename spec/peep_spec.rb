require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      # connection.exec("INSERT INTO peeps (peep) VALUES ('Hello world.');")
      # connection.exec("INSERT INTO peeps (peep) VALUES ('2nd peep!');")
      peep_1 = Peep.create(peep: 'Hello world.')
      peep_2 = Peep.create(peep: '2nd peep!')
      # setup
      expected_peeps = [
        peep_1,
        peep_2
      ]
      within("peeps") { expect(Peep.all).to eq expected_peeps }
    end

    it 'creates a new peep' do
      peep = Peep.create(peep: 'A new peep')
      within('peeps') { expect(Peep.all).to include 'A new peep' }
    end

  end
end
