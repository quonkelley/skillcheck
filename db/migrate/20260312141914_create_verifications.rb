class CreateVerifications < ActiveRecord::Migration[7.1]
  def change
    create_table :verifications do |t|
      t.references :mentor, null: false, foreign_key: { to_table: :users }
      t.references :learner, null: false, foreign_key: { to_table: :users }
      t.string :skill_name, null: false
      t.string :verification_hash, null: false
      t.jsonb :metadata, default: {}

      t.timestamps
    end
    add_index :verifications, :verification_hash, unique: true
  end
end
