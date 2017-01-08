class CreateForgotmails < ActiveRecord::Migration
  def change
    create_table :forgotmails do |t|
      
      t.string :sender
      t.string :reciever
      t.string :title
      t.string :content
      t.timestamps null: false
    end
  end
end
