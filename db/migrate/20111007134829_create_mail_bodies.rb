class CreateMailBodies < ActiveRecord::Migration
  def change
    create_table :mail_bodies do |t|
      t.string :title
      t.text :body
      t.integer :flag

      t.timestamps
    end
  end
end
