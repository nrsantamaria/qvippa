class Qvipp < ActiveRecord::Base
  has_and_belongs_to_many(:user)
  before_save(:downcase_haiku)
  # validates(:haiku, {:presence => true, :length => {:maximum => 30}})
  validate :word_count3?

  def downcase_haiku
    self.haiku = (haiku.downcase)
  end

  def word_count3?
    if (self.haiku.split(" ").length > 3)
      errors.add(:haiku, "too many words yo!")
    end
  end

end
