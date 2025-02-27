class Plant < ApplicationRecord
  belongs_to :garden

  validates :name, presence: true

  has_many :completions
  has_many :chores, through: :completions
end
