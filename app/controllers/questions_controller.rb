class QuestionsController < ApplicationController
  before_action :set_questionnaire, only: %i[ index new show create edit update destroy ]
  before_action :set_question, only: %i[ show edit update destroy ]

  # GET /questions or /questions.json
  def index
    @questions = @questionnaire.questions.order(position: :asc)
  end

  def random
    if params[:question_id]
      @question = Question.find(params[:question_id])
    else
      @question = Question.all.sample
    end
  end

  # GET /questions/1 or /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = @questionnaire.questions.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions or /questions.json
  def create
    @question = @questionnaire.questions.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to [@questionnaire, @question], notice: "Question was successfully created." }
        format.json { render :show, status: :created, location: [@questionnaire, @question] }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1 or /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to [@questionnaire, @question], notice: "Question was successfully updated." }
        format.json { render :show, status: :ok, location: [@questionnaire, @question] }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1 or /questions/1.json
  def destroy
    @question.destroy

    respond_to do |format|
      format.html { redirect_to questionnaire_questions_url(@questionnaire), notice: "Question was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_questionnaire
      @questionnaire = Questionnaire.find(params[:questionnaire_id])
    end

    def set_question
      @question = @questionnaire.questions.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def question_params
      params.require(:question).permit(:name, :position, :question_source_type, :required, :question_source_value, :answer_type, :questionnaire_id)
    end
end
