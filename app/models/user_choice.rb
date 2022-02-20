# == Schema Information
#
# Table name: user_choices
#
#  id             :uuid             not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  answer_id      :uuid             not null
#  user_answer_id :uuid             not null
#
# Indexes
#
#  index_user_choices_on_answer_id       (answer_id)
#  index_user_choices_on_user_answer_id  (user_answer_id)
#
# Foreign Keys
#
#  fk_rails_...  (answer_id => answers.id)
#  fk_rails_...  (user_answer_id => user_answers.id)
#
class UserChoice < ApplicationRecord
  belongs_to :answer
  belongs_to :user_answer
end
