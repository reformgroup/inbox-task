# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  ancestry   :string
#  name       :string           not null
#  company_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  deleted_at :datetime
#  creator_id :integer
#  updater_id :integer
#  deleter_id :integer
#

class Team < ApplicationRecord
  include Searchable
  include Filterable
  include Sortable
  include Userstampable::Stampable
  
  VALID_NAME_REGEX  = /[[:word:][:punct:][:blank:]]+/i
  
  has_ancestry
  has_many :team_user
  has_many :users, through: :team_user
  accepts_nested_attributes_for :users, allow_destroy: true
  
  validates :name, presence: true, length: { maximum: 50 }, 
            format: { with: VALID_NAME_REGEX }
end
