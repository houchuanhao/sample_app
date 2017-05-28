class AddIndexToUsersEmail < ActiveRecord::Migration[5.1]
  def change
  	add_index :users, :email, unique: true #为user表中的email列创建索引,unique:true保证唯一
  end
end
