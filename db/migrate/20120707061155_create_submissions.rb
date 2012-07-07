class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.float :guess
      t.string :author
      t.integer :post_id

      t.timestamps
    end
  end
end
