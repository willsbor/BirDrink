# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

items = ['冰鎮紅茶', '茶裏王', '冷泡茶', '酸梅湯', '茶花綠茶', 
	'麥香紅茶', '日式綠茶', '速纖', '涼爽茶', '美粒果-柳橙', '青草茶', '綠豆湯', 
	'可爾必思水語', '偉恩咖啡x2', '偉恩咖啡', '伯朗咖啡', '伯朗咖啡－藍山', '牛奶花生', 
	'C.C. Lemon', '阿薩姆奶茶', '蘋果西打', '義大力', '奧利多', '巧克力牛奶', '可口可樂', 
	'百事可樂', '36咖啡？', '蘆筍汁', '菠密果菜汁', '台糖加鹽沙士', '冬瓜露', '親親檸檬紅茶', 
	'御茶園-日式綠茶', '八寶粥']

for item in items do 
	ds = Drink.where(:name => item)
	if ds.length == 0
		d = Drink.create(name: item)
		d.empty = false
		d.save
	end
end

