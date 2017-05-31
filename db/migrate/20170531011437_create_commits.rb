class CreateCommits < ActiveRecord::Migration[5.1]
  def change
    create_table :commits do |t|
      t.String :content
      t.references :micropost, foreign_key: true

      t.timestamps
    end
  end
end
