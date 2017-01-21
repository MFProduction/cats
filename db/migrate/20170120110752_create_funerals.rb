class CreateFunerals < ActiveRecord::Migration[5.0]
  def change
    create_table :funerals do |t|
      t.string :cat_name
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
