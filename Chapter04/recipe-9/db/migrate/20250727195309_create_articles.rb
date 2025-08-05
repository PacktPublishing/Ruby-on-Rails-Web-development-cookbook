class CreateArticles < ActiveRecord::Migration[8.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :summary
      t.text :content
      t.string :author
      t.datetime :published_at
      t.string :category
      t.string :image_url
      t.string :slug

      t.timestamps
    end
  end
end
