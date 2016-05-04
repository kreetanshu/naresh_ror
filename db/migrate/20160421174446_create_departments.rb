class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :domain
      t.text :desc

      t.timestamps null: false
    end
  end
end
