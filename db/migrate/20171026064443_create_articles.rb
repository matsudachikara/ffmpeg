class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :video_url
      t.string :video_status

      t.timestamps
    end
  end
end
