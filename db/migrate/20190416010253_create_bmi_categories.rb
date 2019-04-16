class CreateBmiCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :bmi_categories do |t|
      t.string :name
      t.float :from
      t.float :to

      t.timestamps
    end
  end
end
