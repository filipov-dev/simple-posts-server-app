# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :alias, null: false, unique: true
      t.jsonb :preview, null: false
      t.jsonb :content, null: false
      t.timestamp :published_at, null: false
      t.timestamp :deleted_at

      t.timestamps
    end
  end
end
