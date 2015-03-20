def create_user(overrides = {})
  User.create!({
                 name: 'Test',
                 email: 'test@test.com',
                 password: '123'
               }.merge(overrides))
end