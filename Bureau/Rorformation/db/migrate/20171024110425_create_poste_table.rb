class CreatePosteTable < ActiveRecord::Migration[5.1]
  def change
    create_table :poste_tables do |t|
      t.string :title
      t.text :content
    end
  end
end
