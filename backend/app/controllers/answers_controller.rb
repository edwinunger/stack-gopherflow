class AnswersController < ApplicationController

  def create
    @answer = Answer.new(answer_params)
    @answer.question_id = params[:question_id]
    if @answer.save
      render :json => @answer, :status => :created
    else
      render status: 500
    end
  end

  def upvote
    @answer = Answer.find(params[:answer_id])
    if @answer.upvote
      render :json => @answer, :status => :created
    end
  end

  def downvote
    @answer = Answer.find(params[:answer_id])
    if @answer.downvote
      render :json => @answer, :status => :created
    end
  end

  private
  def answer_params
    params.require(:answer).permit(
          :title,
          :content
          )
  end

end
