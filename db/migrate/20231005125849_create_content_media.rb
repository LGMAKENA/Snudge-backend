class CreateContentMedia < ActiveRecord::Migration[7.0]
  def change
    create_table :content_media do |t|
      t.references :content,foreign_key: true
      t.string :link
      t.timestamps
    end
  end
end
