class CreateUserAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :user_answers, id: :uuid do |t|
      t.text :content
      t.references :answer, type: :uuid
      t.references :question, null: false, foreign_key: true, type: :uuid
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
