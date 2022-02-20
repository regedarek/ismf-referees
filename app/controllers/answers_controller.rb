class AnswersController < ApplicationController
  before_action :set_questionnaire
  before_action :set_question
  before_action :set_answer, only: %i[ show edit update destroy ]

  # GET /answers or /answers.json
  def index
    @answers = @question.answers.all
  end

  # GET /answers/1 or /answers/1.json
  def show
  end

  # GET /answers/new
  def new
    @answer = @question.answers.new
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers or /answers.json
  def create
    @answer = @question.answers.new(answer_params)

    respond_to do |format|
      if @answer.save
        format.html { redirect_to [@questionnaire, @question], notice: "Answer was successfully created." }
        format.json { render :show, status: :created, location: [@questionnaire, @question, @answer] }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answers/1 or /answers/1.json
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to [@questionnaire, @question, @answer], notice: "Answer was successfully updated." }
        format.json { render :show, status: :ok, location: [@questionnaire, @question, @answer] }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1 or /answers/1.json
  def destroy
    @answer.destroy

    respond_to do |format|
      format.html { redirect_to questionnaire_question_answers_url(questionnaire_id: @questionnaire.id, question_id: @question.id), notice: "Answer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_questionnaire
      @questionnaire = Questionnaire.find(params[:questionnaire_id])
    end

    def set_question
      @question = @questionnaire.questions.find(params[:question_id])
    end

    def set_answer
      @answer = @question.answers.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def answer_params
      params.require(:answer).permit(:correct, :name, :question_id)
    end
end
