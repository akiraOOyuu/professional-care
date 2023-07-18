class CreateLectures < ActiveRecord::Migration[6.0]
  def change
    create_table :lectures do |t|

      t.integer     :field_id        , null: false
      t.string      :lecture_name    , null: false
      t.date        :lecture_day     , null: false
      t.string      :lecture_time    , null: false
      t.string      :instructor_name , null: false

      t.timestamps

      # 外部キー
      t.references  :user            , null: false, foreign_key: true
     
    end
  end
end
