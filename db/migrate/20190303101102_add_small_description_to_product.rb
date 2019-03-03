class AddSmallDescriptionToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :small_description, :string
  end
end
