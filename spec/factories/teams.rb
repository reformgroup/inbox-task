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

FactoryBot.define do
  factory :team do
    name { Faker::Commerce.department(3, true).humanize }
    
    factory :team_with_subteam do
      after(:build) do |team|
        # create_list(:team, 3, parent: team)
        team.parent = FactoryBot.create(:team)
      end
    end
  end
end
