-- -------------------------------------------------------------------------
-- ----------------------------- Ruby Sanctum ------------------------------
-- -------------------------------------------------------------------------

-- SOME TEXT and SOUND EFECTS
DELETE FROM `script_texts` WHERE `entry` BETWEEN -1666406 AND -1666000;

-- xerestrasza
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
('-1666000','Help! I am trapped within this tree! I require aid!','Спасите! Я под этим деревом. Мне нужна помощь!','17490','6','0','0','SAY_XERESTRASZA_YELL_1'),
('-1666001','Thank you! I could have not held out for much longer. A terrible thing has happened here.','Спасибо! Без вас я бы долго не продержалась... Здесь произошли страшные события...','17491','6','0','0','SAY_XERESTRASZA_YELL_2'),
('-1666002','We believed that the Sanctum was well fortified, but we were not prepareted for the nature of this assault.','Святилище считалось неприступным, но до сих пор оно не подвергалось такому штурму...','17492','0','0','0','SAY_XERESTRASZA_SAY_1'),
('-1666003','The Black Dragonkin materialized from thin air, and set upon us before we could react.','Черные драконы явились из ниоткуда. Мы даже не успели понять что происходит...','17493','0','0','0','SAY_XERESTRASZA_SAY_2'),
('-1666004','We did not stand a chance. As my brethren perished around me, I managed to retreat here and bar the entrance.','Силы были неравны, мои братья гибли один за другим. А я спряталась здесь и запечатала вход.','17494','0','0','0','SAY_XERESTRASZA_SAY_3'),
('-1666005','They slaughtered us with cold efficiency, but the true focus of their interest seemed to be the eggs kept here in the sanctum.','Нас убивали с расчетливой жестокостью, но основной целью врага была кладка яиц в святилище.','17495','0','0','0','SAY_XERESTRASZA_SAY_4'),
('-1666006','The commander of the forces on the ground here is a cruel brute named Zarithrian. But I fear there are greater powers at work.',' Атакой руководил кровожадный Заритриан, но, боюсь, тут замешано и более могущественное зло.','17496','0','0','0','SAY_XERESTRASZA_SAY_5'),
('-1666007','In their initial assault I caught a glimpse of their true leader, a fearsome full-grown Twilight Dragon.','В самом начале я ощутила присутствие их настоящего лидера - огромного сумеречного дракона.','17497','0','0','0','SAY_XERESTRASZA_SAY_6'),
('-1666008','I know not the extent of their plans heroes, but I know this: they cannot be allowed to succeed!','Герои, мне не ведомо чего добиваются эти захватчики. Одно я знаю точно - их нужно остановить!','17498','0','0','0','SAY_XERESTRASZA_SAY_7'),

-- Halion
('-1666100','Meddlesome insects, you\'re too late! The Ruby Sanctum is lost.','Назойливая мошкара! Вы опоздали. Рубиновое святилище пало!','17499','6','0','0','SAY_HALION_SPAWN'),
('-1666101','Your world teeters on the brink of annihilation. You will all bear witness to the coming of a new age of destruction!','Этот мир вот-вот соскользнет в бездну. Вам выпала честь узреть начало эры РАЗРУШЕНИЯ!','17500','6','0','0','SAY_HALION_AGGRO'),
('-1666102','Another hero falls.','Сколько еще таких героев?','17501','6','0','0','SAY_HALION_SLAY_1'),
('-1666103','Ha Ha Ha!','','17502','6','0','0','SAY_HALION_SLAY_2'),
('-1666104','Relish this victory mortals, for it will be your last. This world will burn with the Master\'s return!','Это ваша последняя победа. Насладитесь сполна ее вкусом. Ибо когда вернется мой господин, этот мир сгинет в огне!','17503','6','0','0','SAY_HALION_DEATH'),
('-1666105','Not good enough!','Надоело!','17504','6','0','0','SAY_HALION_BERSERK'),
('-1666106','The heavens burn!','Небеса в огне!','17505','6','0','0','SAY_HALION_SPECIAL_1'),
('-1666107','Beware the shadow!','','17506','6','0','0','SAY_HALION_SPECIAL_2'),
('-1666108','You will find only suffering within the realm of Twilight. Enter if you dare.','Вы найдете только тьму в мире Сумерек. Входите, если посмеете.','17507','6','0','0','SAY_HALION_PHASE_2'),
('-1666109','I am the light AND the darkness! Cower mortals before the Herald of Deathwing!','Я есть свет и я есть тьма! Трепещите, ничтожные, перед посланником Смертокрыла!','17508','6','0','0','SAY_HALION_PHASE_3'),
('-1666110','The orbiting spheres pulse with dark energy!','Во вращающихся сферах пульсирует темная энергия!','0','3','0','0',''),
('-1666111','Your companions effort force Halion further into the physical realm!','Ваши союзники протолкнули Халиона дальше в физический мир!','0','3','0','0',''),
('-1666112','Your companions effort force Halion further into the twilight realm!','Ваши союзники протолкнули Халиона дальше в реальный мир!','0','3','0','0',''),
('-1666113','Your efforts force Halion further out of the physical realm!','','0','3','0','0',''),
('-1666114','Your efforts force Halion further out of the twilight realm!','','0','3','0','0',''),
('-1666115','<need translate>','Находясь в покое в одном из миров, Халион восстанавливает жизненные силы.','0','3','0','0',''),

-- Zarithrian
('-1666200','Alexstrasza has chosen capable allies. A pity that I must END YOU!','Алекстраза выбрала достойных союзников... Жаль, что придется ПРИКОНЧИТЬ ВАС!','17512','6','0','0','SAY_ZARITHRIAN_AGGRO'),
('-1666201','You thought you stood a chance?','Глупо было и надеяться!','17513','6','0','0','SAY_ZARITHRIAN_SLAY_1'),
('-1666202','It\'s for the best.','Все только к лучшему!','17514','6','0','0','SAY_ZARITHRIAN_SLAY_2'),
('-1666203','Halion! I\'m...aah!','ХАЛИОН! Я...','17515','6','0','0','SAY_ZARITHRIAN_DEATH'),
('-1666204','Turn them to ash, minions!','Слуги! Обратите их в пепел!','17516','6','0','0','SAY_ZARITHRIAN_SPECIAL_1'),

-- baltharus
('-1666300','Ah, the entertainment has arrived...','А-а-а, цирк приехал.','17520','6','0','0','SAY_BALTHARUS_AGGRO'),
('-1666301','Baltharus leaves no survivors!','Балтар не оставляет живых!','17521','6','0','0','SAY_BALTHARUS_SLAY_1'),
('-1666302','This world has enough heroes!','В мире хватает героев и без тебя...','17522','6','0','0','SAY_BALTHARUS_SLAY_2'),
('-1666303','I...didn\'t see that coming...','Как… это могло произойти?..','17523','1','0','0','SAY_BALTHARUS_DEATH'),
('-1666304','Twice the pain and half the fun!','Вдвое сильнее страдание.','17524','6','0','0','SAY_BALTHARUS_SPECIAL_1'),
('-1666305','Your power wanes, ancient one! Soon, you will join your friends!','Твоя сила на исходе, Древнейшая! Скоро ты присоединишься к своим друзьям!','17525','6','0','0','SAY_BALTHARUS_YELL'),

-- saviana
('-1666400','You will suffer for this intrusion...','Ваш-ш-ши муки с-cтанут платой за это вторжение!','17528','6','0','0','SAY_SAVIANA_AGGRO'),
('-1666401','As it should be!','Так и должно быть!','17529','6','0','0','SAY_SAVIANA_SLAY_1'),
('-1666402','Halion will be pleased...','Халион будет доволен!','17530','6','0','0','SAY_SAVIANA_SLAY_2'),
('-1666403','Burn in the master\'s flame!','Горите в огне хозяина!','17532','6','0','0','SAY_SAVIANA_SPECIAL_1'),
('-1666404','Saviana Ragefire becomes enraged !','|3-3(%s) впадает в исступление!','0','2','0','0','SAY_SAVIANA_ENRAGE');

DELETE FROM `script_texts` WHERE `entry` <= -1752008 AND `entry` >= -1752016;
DELETE FROM `script_texts` WHERE `entry` <= -1752001 AND `entry` >= -1752006;
DELETE FROM `script_texts` WHERE `entry` <= -1752017 AND `entry` >= -1752036;

INSERT INTO `script_texts` (`entry`, `content_default`, `npc_entry`, `content_loc3`, `sound`, `type`, `language`) VALUES
('-1752008', 'Help! I am trapped within this tree! I require aid!', '0', '', '17490', '1', '0'),         
('-1752009', 'Thank you! I could not have held out for much longer.... A terrible thing has happened here.', '0', '', '17491', '1', '0'),         
('-1752010', 'We believed the Sanctum was well-fortified, but we were not prepared for the nature of this assault.', '0', '', '17492', '0', '0'),         
('-1752011', 'The Black dragonkin materialized from thin air, and set upon us before we could react.', '0', '', '17493', '0', '0'),     
('-1752012', 'We did not stand a chance. As my brethren perished around me, I managed to retreat here and bar the entrance.', '0', '', '17494', '0', '0'),     
('-1752013', 'They slaughtered us with cold efficiency, but the true focus of their interest seemed to be the eggs kept here in the Sanctum.', '0', '', '17495', '0', '0'),    
('-1752014', 'The commander of the forces on the ground here is a cruel brute named Zarithrian, but I fear there are greater powers at work.', '0', '', '17496', '0', '0'),    
('-1752015', 'In their initial assault, I caught a glimpse of their true leader, a fearsome full-grown twilight dragon.', '0', '', '17497', '0', '0'),    
('-1752016', 'I know not the extent of their plans, heroes, but I know this: They cannot be allowed to succeed!', '0', '', '17498', '0', '0'),

( -1752001, "Ah, the entertainment has arrived.", 0, "", 17520, 1, 0),
( -1752002, "Baltharus leaves no survivors!", 0, "", 17521, 1, 0),
( -1752003, "This world has enough heroes.", 0, "", 17522, 1, 0),
( -1752004, "I..Didn''t saw...that coming...", 0, "", 17523, 1, 0),
( -1752005, "Twice the pain and half the fun.", 0, "", 17524, 1, 0),
( -1752006, "Your power wanes, ancient one.... Soon you will join your friends.", 0, "", 17525, 1, 0),
( -1752017, "Alexstrasza has chosen capable allies... A pity that I must END YOU!", 0, "", 17512, 1, 0),
( -1752018, "You thought you stood a chance?", 0, "", 17513, 1, 0),
( -1752019, "It''s for the best.", 0, "", 17514, 1, 0),
( -1752020, "HALION! I...", 0, "", 17515, 1, 0),
( -1752021, "Turn them to ashes, minions!", 0, "", 17516, 1, 0),
( -1752022, "You will sssuffer for this intrusion!", 0, "", 17528, 1, 0),
( -1752023, "As it should be...", 0, "", 17529, 1, 0),
( -1752024, "Halion will be pleased", 0, "", 17530, 1, 0),
( -1752025, "Hhrr...Grr..", 0, "", 17531, 1, 0),
( -1752026, "Burn in the master's flame!", 0, "", 17532, 1, 0),
( -1752027, 'Insects! You''re too late. The Ruby Sanctum is lost.',NULL,NULL,17499,0,0),
( -1752028, 'Your world teeters on the brink of annihilation. You will ALL bear witness to the coming of a new age of DESTRUCTION!',NULL,NULL,17500,0,0),
( -1752029, 'Another hero falls.',NULL,NULL,17501,0,0),
( -1752030, 'Hahahahaha.',NULL,NULL,17502,0,0),
( -1752031, 'Relish this victory, mortals, for it will be your last! This world will burn with the master''s return!',NULL,NULL,17503,0,0),
( -1752032, 'Not good enough.',NULL,NULL,17504,0,0),
( -1752033, 'The heavens burn!',NULL,NULL,17505,0,0),
( -1752034, 'Beware the shadow!',NULL,NULL,17506,0,0),
( -1752035, 'You will find only suffering within the realm of twilight! Enter if you dare!',NULL,NULL,17507,0,0),
( -1752036, 'I am the light and the darkness! Cower, mortals, before the herald of Deathwing!',NULL,NULL,17508,0,0);

DELETE FROM creature WHERE id = 39863;
INSERT INTO creature VALUES ('250456', '39863', '724', '15', '1', '0', '0', '3144,93', '527,233', ' 72.887245', '0,110395', '604800', '0', '0', '11156000', '0', '0', '0', '0', '0');
