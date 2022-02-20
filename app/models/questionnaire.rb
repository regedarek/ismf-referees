# == Schema Information
#
# Table name: questionnaires
#
#  id         :uuid             not null, primary key
#  name       :string           not null
#  state      :integer          default(0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Questionnaire < ApplicationRecord
  enum state: [:draft, :open, :closed]

  #has_many :questions, dependent: :destroy

  validates :name, presence: true

  def self.state_select
    states.keys.map { |k| [Questionnaire.human_enum_name(:state, k), k] }
  end
end
