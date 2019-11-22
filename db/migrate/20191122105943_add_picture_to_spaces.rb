class AddPictureToSpaces < ActiveRecord::Migration[5.1]
  def change
    add_column :spaces, :picture, :string
  end
end
