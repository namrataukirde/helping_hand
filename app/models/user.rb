class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :detail, polymorphic: true

  accepts_nested_attributes_for :detail

  def build_detail(params)
    self.detail = detail_type.constantize.new(params)
  end
end
