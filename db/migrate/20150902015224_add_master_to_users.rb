class AddMasterToUsers < ActiveRecord::Migration
  #동아리 신청시 허가로써 master DB를 만들었으나 아직 미사용
  def change
    add_column :users, :master, :boolean, default: false
  end
end
