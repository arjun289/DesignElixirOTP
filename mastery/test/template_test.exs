defmodule Mastery.TemplateTest do
  use ExUnit.Case
  use QuizBuilders

  test "building compiles raw template" do
    fields = template_fields()
    template = Template.new(fields)

    assert is_nil(Keyword.get(fields, :compiled))
    assert not is_nil(template.compiled)
  end
end
