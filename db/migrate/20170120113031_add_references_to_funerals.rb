class AddReferencesToFunerals < ActiveRecord::Migration[5.0]
  def change
    add_reference :funerals, :customer, foreign_key: true
  end
end
