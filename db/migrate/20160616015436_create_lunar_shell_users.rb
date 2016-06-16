class CreateLunarShellUsers < ActiveRecord::Migration
  def change
    create_table :lunar_shell_users do |t|
      t.string  :username,        limit: 32, null: false
      t.string  :password_digest, null: false
      t.boolean :admin,           default: false, null: false

      t.index :username, unique: true

      t.timestamps null: false
    end
  end
end
