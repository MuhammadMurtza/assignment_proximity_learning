class CreateEmployments < ActiveRecord::Migration[7.0]
  def change
    create_table :employments do |t|
      t.string :employer, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
