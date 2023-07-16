class Rank < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '該当なし' }, 
    { id: 3, name: '職務分野別リーダー' },
    { id: 4, name: '中核リーダー' },
    { id: 5, name: '専門リーダー' }
  ]
end