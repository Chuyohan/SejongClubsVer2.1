class AddPermitToClubs < ActiveRecord::Migration
  def change
    add_column :clubs, :permit, :boolean, default: false
  end
end
