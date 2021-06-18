class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.boolean :private
      t.text :about

      t.timestamps
    end
  end
end
