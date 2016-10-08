class TeamUser < ApplicationRecord
  include Userstampable::Stampable
  
  belongs_to :user
  belongs_to :team
end
