class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :detail, polymorphic: true
  has_one :address, through: :detail

  accepts_nested_attributes_for :detail

  delegate :items, to: :detail

  def build_detail(params)
    self.detail = detail_type.constantize.new(params)
  end
end
