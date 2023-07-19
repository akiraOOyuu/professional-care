class Field < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '【専門】乳児保育' }, 
    { id: 3, name: '【専門】幼児教育' },
    { id: 4, name: '【専門】障害児保育' },
    { id: 5, name: '【専門】食育・アレルギー' },
    { id: 6, name: '【専門】保健衛生・安全対策' }, 
    { id: 7, name: '【専門】保護者支援・子育て支援' },
    { id: 8, name: '【マネジメント研修】' }, 
    { id: 9, name: '【保育実践研修】' }
  ]
end