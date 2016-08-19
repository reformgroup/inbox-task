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
  
  VALID_NAME_REGEX  = /[:alpha:\d -_]+/i
  
  has_ancestry
  
  validates :name, presence: true, length: { maximum: 50 }, 
            format: { with: VALID_NAME_REGEX }
end
