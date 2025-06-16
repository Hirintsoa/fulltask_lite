class TaskList < ApplicationRecord
  has_many :tasks, dependent: :destroy
  accepts_nested_attributes_for :tasks, reject_if: ->(attributes) { attributes['title'].blank? && attributes['description'].blank? }

  validates :title, presence: true, uniqueness: true, length: { minimum: 3 }
  before_validation :normalize_title

  def percent_complete
    return 0 if tasks.count.zero?

    tasks.completed.count / tasks.count.to_f * 100
  end

  private

  def normalize_title
    self.title = title.to_s.strip.titleize if title.present?
  end
end
