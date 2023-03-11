# Post はブログのひとつの投稿を表すモデル
class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :body, presence: true
end
