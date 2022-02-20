class UserAnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])

    @user_answer = @question.user_answers.new(user_answer_params)

    respond_to do |format|
      if @user_answer.save
        format.html { redirect_to random_questions_path(question_id: @question.id), notice: "Thank you for the answer." }
        format.json { render :show, status: :created, location: random_questions_path(question_id: @question.id) }
      else
        format.html { redirect_to random_questions_path(question_id: @question.id) }
        format.json { render json: user_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    user_answer = UserAnswer.find(params[:id])

    respond_to do |format|
      if user_answer.update(user_answer_params)
        format.html { redirect_to user_answer.question, notice: "Thank you for the answer." }
        format.json { render :show, status: :created, location: user_answer.question }
      else
        format.html { redirect_to user_answer.question }
        format.json { render json: user_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_answer_params
    params.require(:user_answer).permit(
      :body, :question_id, :user_id, :answer_id, answer_ids: []
    )
  end
end
