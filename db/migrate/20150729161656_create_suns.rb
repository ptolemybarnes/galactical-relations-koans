class CreateSuns < ActiveRecord::Migration
  def change
    create_table :suns do |t|

      t.timestamps null: false
    end
  end
end
