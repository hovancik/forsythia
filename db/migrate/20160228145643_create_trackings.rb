class CreateTrackings < ActiveRecord::Migration
  def change
    create_table :trackings do |t|
      t.references :user, index: true, foreign_key: true
      t.references :client, index: true, foreign_key: true
      t.datetime :started_at
      t.datetime :ended_at
      t.text :note

      t.timestamps null: false
    end
  end
end
