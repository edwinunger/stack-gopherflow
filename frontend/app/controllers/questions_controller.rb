require 'httparty'

KEY = ENV['GITHUB_API_KEY']
HOST = ENV['GITHUB']

class QuestionsController < ApplicationController
  include HTTParty

  def index
    @questions = Overflow.new.questions
    @question = Question.new
    @quote = HTTParty.get("https://api.github.com/zen", {headers: {'Authorization' => KEY, 'User-Agent' => 'gopherflow'}} )
  end

  def create
    @question = Overflow.new.create_question(params)
    respond_to do |format|
      if @question.save
        format.json {render :json => @question, :status => :created}
      else
        format.html {render action: 'index'}
        format.json { render :json => root_path.errors.full_messages, :status => :unprocessable_entity}
      end
    end
  end

  def show
    @payload = Overflow.new.show_question(params[:id])
    @question = Question.new(@payload[0])
    @answers = @payload[1]
    @answer = Answer.new
    @quote = HTTParty.get("https://api.github.com/zen", {headers: {'Authorization' => KEY, 'User-Agent' => 'bananaboat'}} )
  end

  def destroy
    Overflow.new.destroy(params[:id])
    redirect_to root_path
  end

  def edit
    @payload = Overflow.new.show_question(params[:id])
    @question = Question.new(@payload[0])
  end

  def update
    Overflow.new.edit(params[:id], params)
    redirect_to "/questions/#{params[:id]}"
  end

  def upvote
    @question = Overflow.new.question_upvote(params[:question_id], params)
    if @question.upvote
      respond_to do |format|
        format.json {render :json => @question, :status => :created}
      end
    else
      format.html {render action: 'index'}
      format.json { render :json => root_path.errors.full_messages, :status => :unprocessable_entity}
    end
  end

  def downvote
    @question = Overflow.new.question_downvote(params[:question_id], params)
    if @question.downvote
      respond_to do |format|
        format.json {render :json => @question, :status => :created}
      end
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
