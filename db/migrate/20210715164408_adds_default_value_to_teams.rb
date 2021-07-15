class AddsDefaultValueToTeams < ActiveRecord::Migration[6.1]
  def change
    change_column :teams, :private, :boolean, default: false
  end
end
