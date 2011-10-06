class CreateMails < ActiveRecord::Migration
  def change
    create_table :mails do |t|
      t.text :title
      t.text :body

      t.timestamps
    end
  end
end
