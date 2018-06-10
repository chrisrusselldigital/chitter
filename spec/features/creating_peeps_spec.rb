feature 'Adding a new peep' do
  scenario 'A user can add a peep to Chitter' do
    visit('/peeps')
    fill_in('peep', with: 'Some content')
    click_button('Submit')

    expect(page).to have_content 'Some content'
  end
end
