class AddAuthorsPassword < ActiveRecord::Migration[6.1]
  def change
    add_column :authors, :password, :string
  end
end
