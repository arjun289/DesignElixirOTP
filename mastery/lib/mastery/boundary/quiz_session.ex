defmodule Mastery.Boundary.QuizSession do
  alias Mastery.Core.{Quiz, Response}
  use GenServer



  ################### server callbacks ####################
  def init({quiz, email}) do
    {:ok, {quiz, email}}
  end

  def handle_callback(:select_question, _from, {quiz, email}) do
    quiz = Quiz.select_question(quiz)
    {:reply, quiz.current_question.asked, {quiz, email}}
  end
end
