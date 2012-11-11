class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :name
      t.boolean :requested

      t.timestamps
    end
  end
end
