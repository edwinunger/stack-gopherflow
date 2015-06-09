class AnswersController < ApplicationController

  def create
    @answer = Overflow.new.create_answer(params[:question_id], params)
    respond_to do |format|
      if @answer.save
        format.json {render :json => @answer, :status => :created}
        redirect_to "/questions/#{params[:question_id]}"
      else
        p "Danger, Will Robinson!"
      end
    end
  end

  def upvote
    @answer = Overflow.new.answer_upvote(params[:answer_id], params)
    if @answer.upvote
      respond_to do |format|
        format.json {render :json => @answer, :status => :created}
      end
    end
  end

  def downvote
    @answer = Overflow.new.answer_downvote(params[:answer_id], params)
    if @answer.downvote
      respond_to do |format|
        format.json {render :json => @answer, :status => :created}
      end
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
