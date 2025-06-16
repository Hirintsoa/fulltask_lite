class TaskList < ApplicationRecord
  has_many :tasks, dependent: :destroy
  accepts_nested_attributes_for :tasks

  validates :title, presence: true, uniqueness: true
  before_validation :normalize_title

  private

  def normalize_title
    self.title = title.to_s.strip.titleize if title.present?
  end
end
