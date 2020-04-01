module TestPassagesHelper
  def colored_percent(test_passage)
    color = test_passage.success? ? 'green' : 'red'
    "<span style='color: #{color}'>#{format('%d', test_passage.success_percent)}</span>".html_safe
  end

  def test_complete_message(test_passage)
    if test_passage.success?
      'Тест пройден!'
    else
      'Тест не пройден!'
    end
  end

  def progress_bar_width(test_passage)
    test_passage.current_question_number.to_f / test_passage.test.questions.size * 100
  end
end
