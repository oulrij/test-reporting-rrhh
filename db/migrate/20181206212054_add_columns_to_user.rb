class AddColumnsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :rfc, :string, null: false
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone_number, :string
    add_column :users, :hire_date, :date, null: false
    add_column :users, :job, :string
    add_column :users, :salary, :integer
    add_column :users, :is_employee, :boolean, null: false, default: true
    add_column :users, :is_manager, :boolean, null: false, default: false
    add_column :users, :manager_id, :integer, null: true, index: true
    add_foreign_key :users, :users, column: :manager_id
  end
end
