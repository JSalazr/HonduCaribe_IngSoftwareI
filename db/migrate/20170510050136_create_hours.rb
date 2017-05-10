class CreateHours < ActiveRecord::Migration
  def change
    create_table :hours do |t|
      t.references :employee, foreign_key: true
      t.datetime :date
      t.datetime :time_in
      t.datetime :time_out

      t.timestamps null: false
    end
  end
end
