class User < ApplicationRecord
  # 空データを無効
  validates :name, {presence: true}
  # 重複データを無効
  validates :email, {presence: true, uniqueness: true}
end
