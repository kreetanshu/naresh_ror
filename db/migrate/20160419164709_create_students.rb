class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.integer :age
      t.date :dob
      t.boolean :above18
      t.text :desc

      t.timestamps null: false
    end
  end
end
