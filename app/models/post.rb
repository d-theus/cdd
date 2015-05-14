class Post < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :content

  acts_as_taggable

  def snippet
    content.split(/\r\n\s*\r\n/).first
  end
end
