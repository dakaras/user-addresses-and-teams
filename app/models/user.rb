class User < ActiveRecord::Base
  has_many :addresses
  belongs_to :team
  #Parent object(Team) must be created before the child
  # ex. team = Team.create(name:"Bears", hometown:"Chicago")

  #Rails 5 requires a belongs_to object to assign the foreign key when created
  # ex. u = User.create(email:"dakaras@gmail.com")
  
  #u.errors.full_messages shows any validation errors preventing an instance being created
end
