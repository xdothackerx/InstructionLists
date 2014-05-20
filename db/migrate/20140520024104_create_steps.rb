class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.text :info
      t.references :list, index: true

      t.timestamps
    end
  end
end
