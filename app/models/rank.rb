class Rank < ActiveHash::Base
  self.data = [
    { id: 1, name: '該当なし' }, 
    { id: 2, name: '職務分野別リーダー' },
    { id: 3, name: '中核リーダー' },
    { id: 4, name: '専門リーダー' }
  ]
end