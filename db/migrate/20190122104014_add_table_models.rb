class AddTableModels < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.text :title
      t.datetime :published_date
      t.string :author
      t.text :summary
      t.text :content
      t.string :status

      t.timestamps null: false
    end
  end
end
