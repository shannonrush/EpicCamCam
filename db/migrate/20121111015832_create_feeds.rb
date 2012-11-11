class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.integer :device_id
      t.binary :stream

      t.timestamps
    end
  end
end
