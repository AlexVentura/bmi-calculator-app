class AddCategoryToBmiCalculation < ActiveRecord::Migration[5.2]
  def change
    add_column :bmi_calculations, :category, :string
  end
end
