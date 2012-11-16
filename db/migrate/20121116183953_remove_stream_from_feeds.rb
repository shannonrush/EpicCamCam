class RemoveStreamFromFeeds < ActiveRecord::Migration
  def up
    remove_column :feeds, :stream
  end

  def down
    add_column :feeds, :stream, :binary
  end
end
