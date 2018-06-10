require 'pg'

feature 'View posts' do
  scenario 'A user see all the posts on Chitter' do

    # test data
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps VALUES(1, 'Hello world.');")
    connection.exec("INSERT INTO peeps VALUES(2, '2nd peep!');")

    visit '/'
    expect(page).to have_content "Hello world."
    expect(page).to have_content "2nd peep!"
  end
end
