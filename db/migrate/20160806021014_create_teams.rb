class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :ancestry
      t.string :name, null: false
      t.references :company, index: true, foreign_key: true

      t.timestamps null: false, include_deleted_at: true
      t.userstamps index: true, include_deleter_id: true
    end
  end
end
