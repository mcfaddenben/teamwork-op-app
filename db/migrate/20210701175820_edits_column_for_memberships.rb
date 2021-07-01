class EditsColumnForMemberships < ActiveRecord::Migration[6.1]
  def change
    rename_column :memberships, :seecondary_role, :secondary_role
  end
end
