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
  let(:team) { build(:team) }
  let(:not_valid_names) { %w(foo123 ,foo foo,bar) }
  let(:valid_names) { %w(Foo fOO foo Foo-Bar Константин) }
end
