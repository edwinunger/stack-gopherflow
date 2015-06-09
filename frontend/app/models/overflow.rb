class Overflow
  include HTTParty

  def questions
    get('/questions')
  end

  def create_question(params)
    post('/questions', params)
  end

  def show_question(question_id)
    get("/questions/#{question_id}")
  end

  def destroy(question_id)
    delete("/questions/#{question_id}")
  end

  def edit(question_id, params)
    put("/questions/#{question_id}", params)
  end

  def create_answer(question_id, params)
    post("/questions/#{question_id}/answers", params)
  end

  def question_upvote(question_id, params)
    patch("/questions/#{question_id}/upvote", params)
  end

  def question_downvote(question_id, params)
    patch("/questions/#{question_id}/downvote", params)
  end

  def answer_upvote(question_id, answer_id, params)
    patch("/questions/#{question_id}/answers/#{answer_id}/upvote", params)
  end

  def answer_downvote(question_id, answer_id, params)
    patch("/questions/#{question_id}/answers/#{answer_id}/downvote", params)
  end

  private
  def get(url)
    HTTParty.get("http://127.0.0.1:3001/#{url}").parsed_response
  end

  def post(url, params={}, headers={})
    HTTParty.post("http://127.0.0.1:3001/#{url}", body: params, headers: headers).parsed_response
  end

  def delete(url)
    HTTParty.delete("http://127.0.0.1:3001/#{url}").parsed_response
  end

  def put(url, params={}, headers={})
    HTTParty.put("http://127.0.0.1:3001/#{url}", body: params, headers: headers).parsed_response
  end

  def patch(url, params={}, headers={})
    HTTParty.patch("http://127.0.0.1:3001/#{url}", body: params, headers: headers).parsed_response
  end

end


