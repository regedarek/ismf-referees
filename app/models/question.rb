# == Schema Information
#
# Table name: questions
#
#  id                    :uuid             not null, primary key
#  answer_type           :integer          not null
#  name                  :string           not null
#  position              :integer
#  question_source_type  :integer          not null
#  question_source_value :string           not null
#  required              :boolean          default(FALSE), not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  questionnaire_id      :uuid             not null
#
# Indexes
#
#  index_questions_on_questionnaire_id  (questionnaire_id)
#
# Foreign Keys
#
#  fk_rails_...  (questionnaire_id => questionnaires.id)
#
class Question < ApplicationRecord
  belongs_to :questionnaire
  has_many :answers, dependent: :destroy
  has_many :user_answers, dependent: :destroy

  enum answer_type: { single_choice: 0 }
  #enum answer_type: { single_choice: 0, multiple_choice: 1, long_answer: 2 }

  enum question_source_type: { gdrive_video: 0, gdrive_image: 1 }

  validates :answer_type, :name, :question_source_type, :question_source_value, :questionnaire_id, presence: true

  def self.question_source_type_select
    question_source_types.keys.map { |k| [Question.human_enum_name(:question_source_type, k), k] }
  end

  def self.answer_type_select
    answer_types.keys.map { |k| [Question.human_enum_name(:answer_type, k), k] }
  end
end
