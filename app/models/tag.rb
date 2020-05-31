class Tag < ActiveHash::Base
  self.data = [
      {id: 1, name: 'ひろしのテーマ'}, {id: 2, name: 'アニメOP'}, {id: 3, name: 'test'},
  ]
end