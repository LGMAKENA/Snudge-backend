class CreateContentMedia < ActiveRecord::Migration[7.0]
  def change
    create_table :content_media do |t|

      t.timestamps
    end
  end
end
