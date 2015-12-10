class AddIndexToUsuariosUsuario < ActiveRecord::Migration
  def change
    add_index :usuarios, :usuario, unique: true
  end
end
