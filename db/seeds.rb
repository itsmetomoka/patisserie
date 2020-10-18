# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Category.create!(
	category_name: 'ケーキ',
	is_active: "true"
	)
Category.create!(
	category_name: 'プリン',
	is_active: "true"
	)
Category.create!(
	category_name: '焼き菓子',
	is_active: "true"
	)
Category.create!(
	category_name: 'キャンディ',
	is_active: "true"
	)

Product.create!(
	category_id: '1',
	name: 'ケーキ',
	introduction: '美味しい',
	price: '4200',
	is_active: 'true',
	image: open('./app/assets/images/cake-image-6.jpg')
	)

Product.create!(
	category_id: '1',
	name: 'モンブラン',
	introduction: '高千穂産の和栗を丁寧に裏ごしたマロンペーストと甘さ控えめの軽い生クリームを合わせました',
	price: '800',
	is_active: 'true',
	image: open('./app/assets/images/cake-image.jpg')
	)
Product.create!(
	category_id: '1',
	name: 'チョコレートムース',
	introduction: '濃厚なチョコレートムースと、オレンジのお酒の効いた大人のケーキ',
	price: '620',
	is_active: 'true',
	image: open('./app/assets/images/cake-image-2.jpg')
	)

Product.create!(
	category_id: '4',
	name: 'キャンディ',
	introduction: '苺味の可愛らしいキャンディ',
	price: '560',
	is_active: 'true',
	image: open('./app/assets/images/cake-image-3.jpg')
	)
Product.create!(
	category_id: '1',
	name: 'ブルーベリータルト',
	introduction: '国産ブルーベリーをふんだんに使用した贅沢なケーキ',
	price: '4000',
	is_active: 'true',
	image: open('./app/assets/images/cake-image-4.jpg')
	)
Product.create!(
	category_id: '1',
	name: 'シュークリーム',
	introduction: '生クリームとカスタードクリームをたっぷり詰めました',
	price: '400',
	is_active: 'true',
	image: open('./app/assets/images/cake-image-5.jpg')
	)
Product.create!(
	category_id: '2',
	name: 'プリン',
	introduction: '濃厚プリン',
	price: '400',
	is_active: 'true',
	image: open('./app/assets/images/cake-image-7.jpg')
	)
Product.create!(
	category_id: '3',
	name: 'クッキー',
	introduction: 'サクサククッキー',
	price: '600',
	is_active: 'true',
	image: open('./app/assets/images/cake-image-8.jpg')
	)
Product.create!(
	category_id: '1',
	name: 'ブルーベリータルト',
	introduction: '国産ブルーベリーをふんだんに使用した贅沢なケーキ',
	price: '4000',
	is_active: 'true',
	image: open('./app/assets/images/cake-image-4.jpg')
	)
Product.create!(
	category_id: '1',
	name: 'シュークリーム',
	introduction: '生クリームとカスタードクリームをたっぷり詰めました',
	price: '400',
	is_active: 'true',
	image: open('./app/assets/images/cake-image-5.jpg')
	)
Product.create!(
	category_id: '1',
	name: 'ブルーベリータルト',
	introduction: '国産ブルーベリーをふんだんに使用した贅沢なケーキ',
	price: '4000',
	is_active: 'true',
	image: open('./app/assets/images/cake-image-4.jpg')
	)
Product.create!(
	category_id: '1',
	name: 'シュークリーム',
	introduction: '生クリームとカスタードクリームをたっぷり詰めました',
	price: '400',
	is_active: 'true',
	image: open('./app/assets/images/cake-image-5.jpg')
	)
Product.create!(
	category_id: '1',
	name: 'ブルーベリータルト',
	introduction: '国産ブルーベリーをふんだんに使用した贅沢なケーキ',
	price: '4000',
	is_active: 'true',
	image: open('./app/assets/images/cake-image-4.jpg')
	)
Product.create!(
	category_id: '1',
	name: 'シュークリーム',
	introduction: '生クリームとカスタードクリームをたっぷり詰めました',
	price: '400',
	is_active: 'true',
	image: open('./app/assets/images/cake-image-5.jpg')
	)


Customer.create!(
	password: 'something',
	email: "email@email.com",
	first_name: '太郎',
	last_name: "けーき",
	first_name_kana: "タロウ",
	last_name_kana: "ケーキ",
	post_code: "1234567",
	address:"東京都千代田区永田町1-1-1",
	phone_number: "08011111111",
 	is_active: "true"
	)
Customer.create!(
	password: 'something',
	email: "name@name.com",
	first_name: 'あ',
	last_name: "あ",
	first_name_kana: "ア",
	last_name_kana: "ア",
	post_code: "1234567",
	address:"東京都千代田区永田町1-1-1",
	phone_number: "08011111111",
 	is_active: "true"
	)
Admin.create!(
	password: 'something',
	email: 'name@name.com'
	)

Address.create!(
	customer_id: '1',
	name: '千葉さん',
	address: '千葉県千葉市千葉',
	post_code: '1111111'
	)

Address.create!(
	customer_id: '1',
	name: '埼玉さん',
	address: '埼玉県千葉市千葉',
	post_code: '2111111'
	)

Address.create!(
	customer_id: '2',
	name: '神奈川さん',
	address: '神奈川県千葉市千葉',
	post_code: '2111111'
	)

