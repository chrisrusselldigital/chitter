feature 'Posting to Chitter' do
  scenario 'A user can post messages to chitter' do
    visit '/'
    expect(page).to have_content "My first post"
  end
end
