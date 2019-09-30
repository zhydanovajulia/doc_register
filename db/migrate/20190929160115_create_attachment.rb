class CreateAttachment < ActiveRecord::Migration[6.0]
  def change
    create_table :attachments do |t|
      t.references :attachable, polymorphic: true
      t.string :data
      t.timestamps
    end
  end
end
