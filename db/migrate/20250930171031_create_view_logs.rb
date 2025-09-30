class CreateViewLogs < ActiveRecord::Migration[8.0]
  def change
    create_table :view_logs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.datetime :viewed_at
      t.string :ip_address

      t.timestamps
    end
  end
end
