module TestPassagesHelper
  def colored_percent(percent)
    color = percent >= 85 ? 'green' : 'red'
    "<span style='color: #{color}'>#{format('%d', percent)}</span>".html_safe
  end
end
