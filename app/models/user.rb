class User < ActiveRecord::Base
  has_many :addresses
  belongs_to :team
  # accepts_nested_attributes_for :addresses

  #Parent object(Team) must be created before the child
  # ex. team = Team.create(name:"Bears", hometown:"Chicago")

  #Rails 5 requires a belongs_to object to assign the foreign key when created
  # ex. u = team.users.build(email:"dan@protonmail.ch")

  # u.errors.full_messages shows any validation errors preventing an instance being created

  def addresses_attributes=(addresses_attributes)
    # raise addresses_attributes.inspect

    #add an index argument when using fields_for in the form to reconvert addresses_attributes to a hash
    addresses_attributes.each do |i, adr|
      self.addresses.build(adr)
    end
  end

  def team_attributes(team_attributes)
    self.team = Team.where(name: team_attributes[:name]).first_or_create do |t|
      t.hometown = team_attributes[:hometown]
    end
  end

  # def team_name=(name)
  #   self.team = Team.find_by(name: name)
  # end
end
