class CreateBreastfeedings < ActiveRecord::Migration[6.0]
  def change
    create_table :breastfeedings do |t|
      t.references :baby
      t.integer :time
      t.integer :quantity

      t.timestamps
    end
  end
end
