class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.references :department, null: false, foreign_key: true

      t.timestamps
    end
  end
end
