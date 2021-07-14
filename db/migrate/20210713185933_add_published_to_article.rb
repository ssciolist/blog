class AddPublishedToArticle < ActiveRecord::Migration[6.1]
  def change
    change_table :articles do |t|
      t.boolean :published, :null => false, :default => false
    end
  end
end
