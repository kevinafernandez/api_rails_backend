class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :name
      t.string :body
      t.references :section, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
    end
  end
end
