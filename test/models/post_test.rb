require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test '値が妥当な場合は保存できること' do
    p = Post.new(title: 'title1', body: 'body1')
    assert p.save
  end

  test 'titleが入力されていないときには、保存できないこと' do
    p = Post.new(body: 'body1')
    assert_not p.save
  end

  test 'titleがとても長いときには、保存できないこと' do
    p = Post.new(title: 't' * 51, body: 'body1')
    assert_not p.save
  end

  test 'bodyが入力されていないときには、保存できないこと' do
    p = Post.new(title: 'title1')
    assert_not p.save
  end
end
