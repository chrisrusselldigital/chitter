describe '.find' do
  it 'finds a user by their ID' do
    user = User.create(email: 'test@example.com', password: 'password123')
    expect(User.find(user.id).email).to eq user.email
  end
  it 'returns nil if there is no ID given' do
    expect(User.find(nil)).to eq nil
  end
end
