class CreateUserAccessArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :user_access_articles do |t|
      t.belongs_to :user
      t.belongs_to :article
      t.boolean :access, default: true 

      t.timestamps
    end
  end
end
