class Campaign < ApplicationRecord
  before_validation :set_member, on: :create
  before_validation :set_status, on: :create

  belongs_to :user
  has_many :members, dependent: :destroy # apaga uma campanha e os membros tbm serão apagados
  # before_create :set_member
  # before_create :set_status
  enum status: [:pending, :finished]
  validates :title, :description, :user, :status, presence: true

  def set_status
    self.status = :pending
  end
  
  def set_member
    self.members << Member.create(name: self.user.name, email: self.user.email)
  end
  
end
