class AddResolutionColumn < ActiveRecord::Migration
  def change
     add_column :usagerecords, :homepage, :string
     add_column :usagerecords, :resolution, :string
  end
end
