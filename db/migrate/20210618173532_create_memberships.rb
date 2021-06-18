class CreateMemberships < ActiveRecord::Migration[6.1]
  def change
    create_table :memberships do |t|
      t.integer :user_id
      t.integer :team_id
      t.string :primary_role
      t.string :seecondary_role
      t.boolean :fill
      t.string :assigned_role

      t.timestamps
    end
  end
end
