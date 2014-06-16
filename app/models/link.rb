require 'securerandom'

class Link < ActiveRecord::Base
  CUSTOM_LENGTH = 4

  before_create :generate_custom
  before_create :set_hits

  validates :url,
            presence: true,
            length: { minimum: 5, maximum: 150 }
  validates :custom,
            uniqueness: { case_sensitive: false },
            allow_nil: true,
            allow_blank: true,
            length: { maximum: 50 }

  def set_hits
    if self.hits.nil?
      self.hits = 0
    end
  end

  def generate_custom
    if self.custom.nil? || self.custom.blank?
      self.custom = SecureRandom.hex[0 .. (CUSTOM_LENGTH-1)]
    else
      self.custom.downcase!
    end
  end
end
