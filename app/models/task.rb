class Task < ApplicationRecord
  belongs_to :task_list

  attribute :completed, :boolean, default: false
  enum :priority, [ :low, :medium, :high ], default: :low, validate: true
  validates :title, presence: true, uniqueness: { scope: :task_list_id }, length: { minimum: 3 }

  before_validation :normalize_title

  scope :completed, -> { where(completed: true) }
  scope :incomplete, -> { where(completed: false) }

  def toggle_completion
    update(completed: !completed)
  end

  private

  def normalize_title
    self.title = title.to_s.strip.titleize if title.present?
  end
end
