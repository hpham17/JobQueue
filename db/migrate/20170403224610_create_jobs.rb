class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :url
      t.boolean :completed

      t.timestamps
    end
  end
end
