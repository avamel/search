# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Country.create(name: 'Украина')
Country.create(name: 'Болгария')
Country.create(name: 'Франция')
Country.create(name: 'Италия')
Country.create(name: 'Черногория')
Country.create(name: 'Польша')
Type.create(name: 'Отдых на море')
Type.create(name: 'Экскурсионные автобусные туры')
Type.create(name: 'Экскурсионные туры с отдыхом на море')
Type.create(name: 'Туры выходного дня')
Type.create(name: 'Экскурсионные авиа туры')
Type.create(name: 'Морские круизы')
Type.create(name: 'Отдых в Крыму')
Type.create(name: 'Детский и молодежный отдых в Болгарии')
Tour.create(title: 'Детский и молодежный отдых на Солнечном берегу, отель "Актиния" 4*', price: '335', country_ids: [2], type_ids: [8], tourdates_attributes: [startdate:'2013-07-10'])
Tour.create(title: 'Берлин – Амстердам – Париж (3 дня) – Фонтенбло* – Прага – Вена', price: '415', country_ids: [3], type_ids: [2], tourdates_attributes: [startdate:'2013-07-11'])
Tour.create(title: 'Берлин – Амстердам – Кюккенхоф*– Брюссель – Париж (3 Дня) – Фонтенбло *– Реймс – Люксембург – Трир* ', price: '370', country_ids: [3], type_ids: [2], tourdates_attributes: [startdate:'2013-08-22'])
Tour.create(title: 'Берлин – Амстердам – Париж (2 дня) – Версаль* – Ницца – Монако – Венеция – Вена', price: '445', country_ids: [3,4], type_ids: [2], tourdates_attributes: [startdate:'2013-08-24'])
Tour.create(title: 'Вена – Венеция – Римини (10 дней на Адриатическом море) – Флоренция – Рим – Ватикан – Сорренто – Зальцбург ', price: '730', country_ids: [4], type_ids: [3], tourdates_attributes: [startdate:'2013-07-17'])
Tour.create(title: 'Прага – Вена – Будва, Сутоморе (отдых на Адриатическом море) – Дубровник – Плитвицкие озера* – Будапешт', price: '445', country_ids: [5], type_ids: [3], tourdates_attributes: [startdate:'2013-08-22'])
Tour.create(title: 'Львов – Олесский замок – Почаев', price: '105', country_ids: [1], type_ids: [4], tourdates_attributes: [startdate:'2013-09-11'])
Tour.create(title: 'Выходные в Варшаве', price: '95', country_ids: [6], type_ids: [4], tourdates_attributes: [startdate:'2013-08-09'])
Tour.create(title: 'Краков – Величка', price: '100', country_ids: [6], type_ids: [4], tourdates_attributes: [startdate:'2013-07-13'])
Tour.create(title: 'Экскурсионный тур в Киев', price: '110', country_ids: [1], type_ids: [4], tourdates_attributes: [startdate:'2013-08-19'])
Tour.create(title: 'Отдых в Затоке — пансионат «Рута» ', price: '450', country_ids: [1], type_ids: [1], tourdates_attributes: [startdate:'2013-09-09'])
Tour.create(title: 'Прага – Вена – Будва (отдых на Адриатическом море) – Будапешт – Краков ', price: '365', country_ids: [6], type_ids: [1], tourdates_attributes: [startdate:'2013-08-17'])
Tour.create(title: 'Туры в Болгарию (он-лайн подбор тура от Tez Tour). Авиа из Минска, Киева и Москвы', price: '255', country_ids: [2], type_ids: [1], tourdates_attributes: [startdate:'2013-09-15'])
Tour.create(title: 'Экскурсионный тур «Рим и Венеция» (вылеты из Минска по пт)', price: '585', country_ids: [4], type_ids: [5], tourdates_attributes: [startdate:'2013-08-28'])
Tour.create(title: 'Морские круизы (он-лайн подбор тура от Natalie Tours).', price: '416', country_ids: [3,4,5], type_ids: [6], tourdates_attributes: [startdate:'2013-07-22'])
Tour.create(title: 'Отдых в Крыму — гостевой дом «Дача Петровичи», Алупка', price: '320', country_ids: [1], type_ids: [7], tourdates_attributes: [startdate:'2013-08-23'])
Tour.create(title: 'Отдых в Крыму — пансионат «Творческая Волна», Коктебель ', price: '240', country_ids: [1], type_ids: [7], tourdates_attributes: [startdate:'2013-08-10'])




