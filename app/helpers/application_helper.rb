module ApplicationHelper
  
  def author_name
    'Иван Бурсак'
  end

  def question_header(question)
    if question.new_record?
      "Create New #{question.test.title} Question"
    else
      "Edit #{question.test.title} Question"
    end
  end

  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to 'Проект на GitHub', "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def flash_message
    flash.map do |message_type, message|
      content_tag(:div, message, class: "alert alert-#{message_type}")
    end.join.html_safe
  end
end
