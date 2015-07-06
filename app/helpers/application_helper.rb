module ApplicationHelper
  DEFAULT_KEYWORDS = 'software, development, engineering, administration, server, blog'

  def title_tag
    str = "Caffeine Driven Devel"
    str << " - #{content_for(:title).strip}" if content_for?(:title)
    raw "<title>#{str}</title>"
  end

  def meta_description
    return unless content_for? :meta_description
    raw "<meta name='description' content='#{content_for(:meta_description).strip}'>"
  end

  def meta_keywords
    kwords = DEFAULT_KEYWORDS
    kwords += ", #{content_for(:meta_keywords).strip}" if content_for?(:meta_keywords)
    raw "<meta name='keywords' content='#{kwords}'>"
  end
end
