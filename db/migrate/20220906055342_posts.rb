class Posts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string "title"
      t.text "content"
      t.integer "author_id"
      t.integer "category_id"
    end
  end
end
