class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :stadium_name
      t.text :address
      t.date :match_date
      t.string :supported_team
      t.text :comment

      t.timestamps
    end
  end
end
