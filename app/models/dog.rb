class Dog < ApplicationRecord
  belongs_to :owner
  validates :name, presence: true, length: { minimum: 2 }
  #:owner, presence: true
end
