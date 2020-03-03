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
end
