class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email

      t.timestamps
      # t.timestamps calls t.updated_at and t.created_at
    end
  end
end
