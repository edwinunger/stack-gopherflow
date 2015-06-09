class QuestionsController < ApplicationController

  def index
    @questions = Question.all
    render json: @questions
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      render :json => @question, :status => :created
    else
      render :json => @question.errors.full_messages, :status => :unprocessable_entity
    end
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
    render json: [@question, @answers]
  end

  def destroy
    @question = Question.find(params[:id])
    if @question.destroy
      render status: 200
    else
      render status: 500
    end
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      render json: @question, status: 200
    else
      render status: 500
    end

  end

  def upvote
    @question = Question.find(params[:question_id])
    if @question.upvote
        render :json => @question, :status => :created
    else
      render status: 500
    end
  end

  def downvote
    @question = Question.find(params[:question_id])
    if @question.downvote
      render :json => @question, :status => :created
    else
      render status: 500
    end
  end

  private

  def question_params
    params.require(:question).permit(
      :title,
      :content
      )
  end

end
