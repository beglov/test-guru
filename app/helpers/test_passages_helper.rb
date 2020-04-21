module TestPassagesHelper
  def colored_percent(test_passage)
    color = test_passage.success? ? 'green' : 'red'
    "<span style='color: #{color}'>#{number_to_percentage(test_passage.success_percent, precision: 0)}</span>".html_safe # rubocop:disable Rails/OutputSafety
  end

  def test_complete_message(test_passage)
    if test_passage.success?
      t('test_passed')
    else
      t('test_failed')
    end
  end

  def progress_bar_width(test_passage)
    test_passage.current_question_number.to_f / test_passage.test.questions.size * 100
  end
end
