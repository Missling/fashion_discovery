class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :title
      t.text :blurb
      t.string :author
      t.string :thumbnail_url
      t.string :details_url

      t.timestamps null: false
    end
  end
end
