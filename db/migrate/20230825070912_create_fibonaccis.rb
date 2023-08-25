class CreateFibonaccis < ActiveRecord::Migration[7.0]
  def change
    create_table :fibonaccis do |t|
      t.integer :value
      t.integer :result
      t.float :runtime

      t.datetime :created_at, precision: 6, null: false
    end
  end
end
