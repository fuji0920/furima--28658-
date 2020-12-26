FactoryBot.define do
  factory :user_order do
    token                 { "tok_abcdefghijk00000000000000000"}
    post                  { '123-4567' }
    shipping_area_id      { 2 }
    city                  { '横浜市緑区' }
    address               { '青山1-1-1' }
    building              { '柳ビル103' }
    tel                   { '09012345678' }
  end
end

