class Article < ApplicationRecord
  belongs_to :author

  # Validations
  validates :title, :description, :markdown, :slug, presence: true
  validates :author_id, presence: true
  validate :author_exists
  validate :validate_tag_array

  private

  def author_exists
    errors.add(:author_id, "does not exist") unless Author.exists?(id: author_id)
  end

  def validate_tag_array
    if tag.is_a?(Array)
      errors.add(:tag, "must be an array of strings") unless tag.all? { |t| t.is_a?(String) }
      errors.add(:tag, "cannot have more than 4 tags") if tag.size > 4
    else
      errors.add(:tag, "must be an array")
    end
  end
end