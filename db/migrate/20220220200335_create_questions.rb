class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions, id: :uuid do |t|
      t.string :name, null: false
      t.integer :position
      t.integer :question_source_type, null: false
      t.boolean :required, null: false, default: false
      t.string :question_source_value, null: false
      t.integer :answer_type, null: false
      t.references :questionnaire, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
