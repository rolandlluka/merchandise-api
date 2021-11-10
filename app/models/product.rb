class Product < ApplicationRecord
  belongs_to :user

  validates :price, presence: true
  validates :name, presence: true, uniqueness: true

  enum code: { mug: 'MUG', tshirt: 'TSHIRT', hoodie: 'HOODIE' }, _default: 'OTHER'
end
