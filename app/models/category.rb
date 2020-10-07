class Category < ActiveHash::Base
  self.data = [
   { id: 1, name: '--' },
   { id: 2, name: '文芸' },
   { id: 3, name: '実用書' },
   { id: 4, name: 'ビジネス書' },
   { id: 5, name: '専門書' }
  ]
end
