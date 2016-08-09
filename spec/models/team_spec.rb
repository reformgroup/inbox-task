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

require 'rails_helper'

RSpec.describe Team, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
