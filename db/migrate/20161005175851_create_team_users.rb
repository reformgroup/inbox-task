class CreateTeamUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :team_users do |t|
      t.references :user, index: true
      t.references :team, index: true
      
      t.timestamps null: false, include_deleted_at: true
      t.userstamps index: true, include_deleter_id: true
    end
  end
end
