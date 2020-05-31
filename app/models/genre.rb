class Genre < ActiveHash::Base
  self.data = [
      {id: 1, name: 'エンターテイメント'}, {id: 2, name: 'ラジオ'}, {id: 3, name: '音楽・サウンド'},
      {id: 4, name: 'ダンス'}, {id: 5, name: '動物'}, {id: 6, name: '自然'},
      {id: 7, name: '料理'}, {id: 8, name: '旅行・アウトドア'}, {id: 9, name: '乗り物'},
      {id: 10, name: 'スポーツ'}, {id: 11, name: '社会・政治・時事'}, {id: 12, name: '技術・工作'},
      {id: 13, name: 'アニメ'}, {id: 14, name: 'ゲーム'}, {id: 15, name: 'その他'},
  ]
end