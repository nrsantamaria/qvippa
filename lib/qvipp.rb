class Qvipp < ActiveRecord::Base
  belongs_to(:user)
  before_save(:downcase_haiku)
  # validates(:haiku, {:presence => true, :length => {:maximum => 30}})
  # validates(:haiku, self.word_count3?)
  # validate :word_count3?

  def downcase_haiku
    self.haiku = (haiku.downcase)
  end
end


class String
  def word_count3?
    (self.split(" ").length > 3) ? (return false) : (return true)
  end
end
