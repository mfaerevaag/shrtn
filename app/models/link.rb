require 'securerandom'

class Link < ActiveRecord::Base

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
      # get all generated
      links = Link.where generated_custom: true

      # get list of customs
      customs = links.map { |l| l.custom.to_i 16 } .sort

      # if empty, start with zero
      if customs.empty?
        gen = 0
      else
        # else, start with worst case
        gen = customs.last + 1

        # try to find better
        customs.each_with_index do |c, i|
          unless c == i
            gen = i
            break
          end
        end
      end

      self.custom = gen.to_s 16
      self.generated_custom = true
    else
      self.custom.downcase!
      self.generated_custom = false
    end

    nil
  end
end
