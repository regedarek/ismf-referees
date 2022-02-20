# == Schema Information
#
# Table name: answers
#
#  id          :uuid             not null, primary key
#  correct     :boolean          default(FALSE), not null
#  description :text
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :uuid             not null
#
# Indexes
#
#  index_answers_on_question_id  (question_id)
#
# Foreign Keys
#
#  fk_rails_...  (question_id => questions.id)
#
class Answer < ApplicationRecord
  belongs_to :question

  validates :name, presence: true
  validates :name, uniqueness: { scope: :question_id }

  validate :only_answer_correct_in_single_choice

  def only_answer_correct_in_single_choice
    if correct && question.single_choice?
      if question.answers.except(self).any? {|answer| answer.correct? }
        errors.add(:correct, "can be only one correct answer")
      end
    end
  end
end
