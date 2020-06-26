defmodule Mastery do
  @moduledoc """
  Documentation for Mastery.
  """
  alias Mastery.Boundary.{
    QuizManager,
    QuizSession,
    TemplateValdiator,
    QuizValidator,
    Proctor
  }
  alias Mastery.Core.Quiz

  def schedule_quiz(quiz, templates, start_at, end_at) do
    with :ok <- QuizValidator.errors(quiz),
      true <- Enum.all?(templates, &(:ok == TemplateValdiator.errors(&1))),
      :ok <- Proctor.schedule_quiz(quiz, templates, start_at, end_at),
      do: :ok , else: (error -> error)
  end

  def build_quiz(fields) do
    with :ok <- QuizValidator.errors(fields),
      :ok <- GenServer.call(QuizManager, {:build_quiz, fields}),
    do: :ok, else: (error -> error)
  end

  def add_template(title, fields) do
    with :ok <- TemplateValdiator.errors(fields),
      :ok <- GenServer.call(QuizManager, {:add_template, title, fields}),
    do: :ok, else: (error -> error)
  end

  def take_quiz(title, email) do
    with %Quiz{}=quiz <- QuizManager.lookup_quiz_by_title(title),
      {:ok, _session} <- QuizSession.take_quiz(quiz, email)
    do
      {title, email}
    else
      error -> error
    end
  end

  def select_question(session) do
    QuizSession.select_question(session)
  end

  def answer_question(session, answer) do
    QuizSession.answer_question(session, answer)
  end
end
