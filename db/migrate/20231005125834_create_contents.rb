class CreateContents < ActiveRecord::Migration[7.0]
  def change
    create_table :contents do |t|
      t.string :title
      t.string :body    
      # audio video article, if audio video then title if article body.
      t.string :status,default: "pending"
      # pending aproved flagged
          t.references :category,foreign_key: true 
      t.references :user,foreign_key: true 

      t.timestamps
    end
  end
end
