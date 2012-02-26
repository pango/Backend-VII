class AddHomepageIdColumn < ActiveRecord::Migration
  def up
    add_column :usagerecords, :homepage_id, :integer
  end

  def down
    remove_column :usagerecords, :homepage_id
  end
end
