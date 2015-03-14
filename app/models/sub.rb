# == Schema Information
#
# Table name: subs
#
#  id          :integer          not null, primary key
#  title       :string
#  description :string
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Sub < ActiveRecord::Base
  validates :title, :description, presence: true
  has_many :post_subs, dependent: :destroy

  has_many(
    :posts,
    through: :post_subs,
    source: :post
  )

  belongs_to(
    :moderator,
    class_name: "User",
    foreign_key: :user_id
  )
end
