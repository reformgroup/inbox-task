# == Schema Information
#
# Table name: team_users
#
#  id         :integer          not null, primary key
#  team_id    :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  deleted_at :datetime
#  creator_id :integer
#  updater_id :integer
#  deleter_id :integer
#

class TeamUser < ApplicationRecord
  include Userstampable::Stampable
  
  belongs_to :team
  belongs_to :user
  accepts_nested_attributes_for :team, :user, allow_destroy: true
  
  validates :user, presence: true
end
