class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.string :location
      t.integer :duration
      t.text :description
      t.integer :price
      t.datetime :start_date
      t.belongs_to :promoter, index: true
      t.timestamps
    end
  end
end
