class CreateBmiCalculations < ActiveRecord::Migration[5.2]
  def change
    create_table :bmi_calculations do |t|
      t.float :weight
      t.float :index
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
