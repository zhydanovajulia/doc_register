class CreateDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :documents do |t|
      t.string :name
      t.string :title
      t.text :description


      t.timestamps
    end

    add_reference :documents, :user, foreign_key: true
  end
end
