class CreateUserCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :user_categories do |t|
      t.date      :employment  , null: false
      t.string    :affiliation , null: false
      t.integer   :rank_id     , null: false
      t.integer   :complete_id , null: false

      t.timestamps
      # 外部キー設定
      t.references  :user            , null: false, foreign_key: true
    end
  end
end
