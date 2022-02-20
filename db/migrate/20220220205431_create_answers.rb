class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers, id: :uuid do |t|
      t.boolean :correct, null: false, default: false
      t.string :name, null: false
      t.text :description
      t.references :question, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
