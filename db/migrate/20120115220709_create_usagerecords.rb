class CreateUsagerecords < ActiveRecord::Migration
  def change
    create_table :usagerecords do |t|
      t.string :browser
      t.string :language
      t.datetime :timestamp
      t.integer :fk_idHomepage

      t.timestamps
    end
  end
end
