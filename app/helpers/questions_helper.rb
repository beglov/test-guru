module QuestionsHelper
  def question_form_title(question)
    if action_name == 'new'
      "Create New #{question.test.title} Question"
    elsif action_name == 'edit'
      "Edit #{question.test.title} Question"
    end
  end
end
