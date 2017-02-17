class CreatePens < ActiveRecord::Migration[5.0]
  def change
    create_table :pens do |t|
      t.string :color, null: false, default: false

      t.timestamps
    end
  end
end
