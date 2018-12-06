class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.datetime :checked_in, null: false
      t.datetime :checked_out
      t.references :user, foreign_key: true

      t.timestamps null: false
    end
  end
end
