class CreateUserChoices < ActiveRecord::Migration[7.0]
  def change
    create_table :user_choices, id: :uuid do |t|
      t.references :answer, null: false, foreign_key: true, type: :uuid
      t.references :user_answer, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
