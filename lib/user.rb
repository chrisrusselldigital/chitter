class User
  def self.find(id)
    return nil unless id
    result = DatabaseConnection.query("SELECT * frOM users WHERE id = '#{id}'")
    User.new(result[0]['id'], result[0]['email'], result[0]['password'])
  end


end
