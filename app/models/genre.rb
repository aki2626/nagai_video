class Genre < ActiveHash::Base
  self.data = [
      {id: 1, name: '北海道'}, {id: 2, name: '青森県'}, {id: 3, name: '岩手県'},

  ]
end