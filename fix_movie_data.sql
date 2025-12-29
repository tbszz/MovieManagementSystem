-- 修复电影数据与海报文件的对应关系
-- 根据对 uploads/covers/poster_X.jpg 的实际内容分析进行更新

UPDATE t_movie SET name = '肖申克的救赎', cover_image = 'uploads/covers/poster_1.jpg' WHERE id = 1;
UPDATE t_movie SET name = '教父', cover_image = 'uploads/covers/poster_2.jpg' WHERE id = 2;
UPDATE t_movie SET name = '蝙蝠侠：黑暗骑士', cover_image = 'uploads/covers/poster_3.jpg' WHERE id = 3;
UPDATE t_movie SET name = '教父2', cover_image = 'uploads/covers/poster_4.jpg' WHERE id = 4;
UPDATE t_movie SET name = '十二怒汉', cover_image = 'uploads/covers/poster_5.jpg' WHERE id = 5;
UPDATE t_movie SET name = '指环王：王者无敌', cover_image = 'uploads/covers/poster_6.jpg' WHERE id = 6;
UPDATE t_movie SET name = '辛德勒的名单', cover_image = 'uploads/covers/poster_7.jpg' WHERE id = 7;
UPDATE t_movie SET name = '指环王：护戒使者', cover_image = 'uploads/covers/poster_8.jpg' WHERE id = 8;
UPDATE t_movie SET name = '低俗小说', cover_image = 'uploads/covers/poster_9.jpg' WHERE id = 9;
UPDATE t_movie SET name = '黄金三镖客', cover_image = 'uploads/covers/poster_10.jpg' WHERE id = 10;
UPDATE t_movie SET name = '指环王：双塔奇兵', cover_image = 'uploads/covers/poster_11.jpg' WHERE id = 11;
UPDATE t_movie SET name = '阿甘正传', cover_image = 'uploads/covers/poster_12.jpg' WHERE id = 12;
UPDATE t_movie SET name = '搏击俱乐部', cover_image = 'uploads/covers/poster_13.jpg' WHERE id = 13;
UPDATE t_movie SET name = '盗梦空间', cover_image = 'uploads/covers/poster_14.jpg' WHERE id = 14;
UPDATE t_movie SET name = '星球大战2：帝国反击战', cover_image = 'uploads/covers/poster_15.jpg' WHERE id = 15;
UPDATE t_movie SET name = '黑客帝国', cover_image = 'uploads/covers/poster_16.jpg' WHERE id = 16;
UPDATE t_movie SET name = '好家伙', cover_image = 'uploads/covers/poster_17.jpg' WHERE id = 17;
UPDATE t_movie SET name = '星际穿越', cover_image = 'uploads/covers/poster_18.jpg' WHERE id = 18;
UPDATE t_movie SET name = '飞越疯人院', cover_image = 'uploads/covers/poster_19.jpg' WHERE id = 19;
UPDATE t_movie SET name = '七宗罪', cover_image = 'uploads/covers/poster_20.jpg' WHERE id = 20;

-- 同时更新部分影片的简介,使其与标题一致
UPDATE t_movie SET description = '一场关于希望与自由的史诗性越狱之旅。' WHERE id = 1;
UPDATE t_movie SET description = '科莱昂家族的权力交替与黑帮风云。' WHERE id = 2;
UPDATE t_movie SET description = '小丑对哥谭市秩序的终极挑战。' WHERE id = 3;
UPDATE t_movie SET description = '维托·科莱昂的崛起与迈克尔·科莱昂的掌权。' WHERE id = 4;
UPDATE t_movie SET description = '十二名陪审员在封闭房间内的灵魂拷问。' WHERE id = 5;
UPDATE t_movie SET description = '中土世界的最后决战,阿拉贡登基。' WHERE id = 6;
UPDATE t_movie SET description = '二战中一段拯救生命的伟大历史。' WHERE id = 7;
UPDATE t_movie SET description = '护戒小队的诞生与冒险开始。' WHERE id = 8;
UPDATE t_movie SET description = '昆汀式的非线性暴力美学。' WHERE id = 9;
UPDATE t_movie SET description = '三名西部牛仔围绕宝藏的博弈。' WHERE id = 10;
UPDATE t_movie SET description = '双塔奇兵的绝望抵抗与树人的觉醒。' WHERE id = 11;
UPDATE t_movie SET description = '跑,阿甘,跑!一个纯真男人的传奇一生。' WHERE id = 12;
UPDATE t_movie SET description = '失眠男人的自我毁灭与搏击规则。' WHERE id = 13;
UPDATE t_movie SET description = '层层入梦,寻找真相与回归的可能。' WHERE id = 14;
UPDATE t_movie SET description = '绝地武士的训练与皇帝的反击。' WHERE id = 15;
UPDATE t_movie SET description = '红胶囊还是蓝胶囊?觉醒于母体。' WHERE id = 16;
UPDATE t_movie SET description = '一个黑帮分子的真实成长史。' WHERE id = 17;
UPDATE t_movie SET description = '穿越黑洞,爱是唯一可以跨越时空的。' WHERE id = 18;
UPDATE t_movie SET description = '在精神病院里对自由的渴望与挣扎。' WHERE id = 19;
UPDATE t_movie SET description = '七种罪孽,一场精心设计的连环杀局。' WHERE id = 20;
