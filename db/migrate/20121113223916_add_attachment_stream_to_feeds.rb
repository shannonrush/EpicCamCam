class AddAttachmentStreamToFeeds < ActiveRecord::Migration
  def self.up
    add_column :feeds, :stream_file_name, :string
    add_column :feeds, :stream_content_type, :string
    add_column :feeds, :stream_file_size, :integer
    add_column :feeds, :stream_updated_at, :datetime
  end

  def self.down
    remove_column :feeds, :stream_file_name
    remove_column :feeds, :stream_content_type
    remove_column :feeds, :stream_file_size
    remove_column :feeds, :stream_updated_at
  end
end
