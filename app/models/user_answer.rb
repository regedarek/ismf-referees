# == Schema Information
#
# Table name: user_answers
#
#  id          :uuid             not null, primary key
#  content     :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  answer_id   :uuid
#  question_id :uuid             not null
#  user_id     :uuid             not null
#
# Indexes
#
#  index_user_answers_on_answer_id    (answer_id)
#  index_user_answers_on_question_id  (question_id)
#  index_user_answers_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (question_id => questions.id)
#  fk_rails_...  (user_id => users.id)
#
class UserAnswer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  belongs_to :answer, optional: true

  has_many :user_choices, dependent: :destroy
  has_many :answers, through: :user_choices

  has_rich_text :body
end
