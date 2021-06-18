class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :summoner_name
      t.string :email
      t.string :password_digest
      t.string :region
      t.text :bio

      t.timestamps
    end
  end
end
