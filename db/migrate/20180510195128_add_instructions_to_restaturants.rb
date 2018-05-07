class AddInstructionsToRestaturants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :instructions, :text
  end
end
