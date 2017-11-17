class Owner < ApplicationRecord
  has_many :dogs

  validates :phone, presence: true, length: { is: 10 }, numericality: { only_integer: true }



end
