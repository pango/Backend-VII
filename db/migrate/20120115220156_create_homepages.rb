class CreateHomepages < ActiveRecord::Migration
  def change
    create_table :homepages do |t|
      t.string :url
      t.string :name
      t.string :beschreibung

      t.timestamps
    end
  end
end
