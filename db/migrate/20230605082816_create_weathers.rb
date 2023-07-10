class CreateWeathers < ActiveRecord::Migration[7.0]
  def change
    create_table :weathers do |t|
      t.references :location, null: false, foreign_key: true
      t.text :main
      t.text :visibility
      t.text :wind
      t.text :clouds

      t.timestamps
    end
  end
end
