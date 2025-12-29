-- Sample Data for Movie Management System
-- Run this after db.sql to populate the database with test data

-- Insert common movie categories
INSERT INTO t_category (name) VALUES ('动作');
INSERT INTO t_category (name) VALUES ('喜剧');
INSERT INTO t_category (name) VALUES ('爱情');
INSERT INTO t_category (name) VALUES ('科幻');
INSERT INTO t_category (name) VALUES ('恐怖');
INSERT INTO t_category (name) VALUES ('惊悚');
INSERT INTO t_category (name) VALUES ('剧情');
INSERT INTO t_category (name) VALUES ('战争');
INSERT INTO t_category (name) VALUES ('犯罪');
INSERT INTO t_category (name) VALUES ('悬疑');
INSERT INTO t_category (name) VALUES ('动画');
INSERT INTO t_category (name) VALUES ('纪录片');
INSERT INTO t_category (name) VALUES ('传记');
INSERT INTO t_category (name) VALUES ('历史');
INSERT INTO t_category (name) VALUES ('奇幻');
INSERT INTO t_category (name) VALUES ('冒险');
INSERT INTO t_category (name) VALUES ('家庭');
INSERT INTO t_category (name) VALUES ('音乐');
INSERT INTO t_category (name) VALUES ('运动');
INSERT INTO t_category (name) VALUES ('西部');

-- Insert sample movies
-- Drama (ID: 7)
INSERT INTO t_movie (name, director, actors, category_id, release_date, description, rating, rating_count, is_hot) 
VALUES ('肖申克的救赎', '弗兰克·达拉邦特', '蒂姆·罗宾斯, 摩根·弗里曼', 7, '1994-09-23', '一个关于希望和自由的经典故事', 9.7, 24500, TRUE);

INSERT INTO t_movie (name, director, actors, category_id, release_date, description, rating, rating_count, is_hot) 
VALUES ('霸王别姬', '陈凯歌', '张国荣, 张丰毅, 巩俐', 7, '1993-01-01', '演艺生涯与时代变迁的交织', 9.6, 18000, TRUE);

-- Comedy (ID: 2)
INSERT INTO t_movie (name, director, actors, category_id, release_date, description, rating, rating_count, is_hot) 
VALUES ('阿甘正传', '罗伯特·泽米吉斯', '汤姆·汉克斯', 2, '1994-07-06', '一个智商只有75的男孩的传奇人生', 9.5, 21000, FALSE);

INSERT INTO t_movie (name, director, actors, category_id, release_date, description, rating, rating_count, is_hot) 
VALUES ('这个杀手不太冷', '吕克·贝松', '让·雷诺, 娜塔莉·波特曼', 1, '1994-09-14', '孤独杀手与小女孩的温情故事', 9.4, 19500, TRUE);

-- Sci-Fi (ID: 4)
INSERT INTO t_movie (name, director, actors, category_id, release_date, description, rating, rating_count, is_hot) 
VALUES ('盗梦空间', '克里斯托弗·诺兰', '莱昂纳多·迪卡普里奥', 4, '2010-07-16', '在梦境中植入想法的惊险旅程', 9.3, 16000, TRUE);

INSERT INTO t_movie (name, director, actors, category_id, release_date, description, rating, rating_count, is_hot) 
VALUES ('星际穿越', '克里斯托弗·诺兰', '马修·麦康纳, 安妮·海瑟薇', 4, '2014-11-07', '爱是跨越时空的唯一力量', 9.3, 15000, FALSE);

-- Action (ID: 1)
INSERT INTO t_movie (name, director, actors, category_id, release_date, description, rating, rating_count, is_hot) 
VALUES ('蝙蝠侠：黑暗骑士', '克里斯托弗·诺兰', '克里斯蒂安·贝尔, 希斯·莱杰', 1, '2008-07-18', '混乱与秩序的终极对决', 9.1, 14000, TRUE);

-- Crime (ID: 9)
INSERT INTO t_movie (name, director, actors, category_id, release_date, description, rating, rating_count, is_hot) 
VALUES ('教父', '弗朗西斯·福特·科波拉', '马龙·白兰度, 阿尔·帕西诺', 9, '1972-03-24', '黑帮家族的史诗篇章', 9.2, 12000, FALSE);

-- Animation (ID: 11)
INSERT INTO t_movie (name, director, actors, category_id, release_date, description, rating, rating_count, is_hot) 
VALUES ('千与千寻', '宫崎骏', '柊瑠美, 入野自由', 11, '2001-07-20', '少女千寻在神秘世界的成长之旅', 9.4, 13000, TRUE);

-- Insert sample news
INSERT INTO t_news (title, content, publish_date) 
VALUES ('欢迎使用电影管理系统', '这是一个基于SSH框架开发的电影管理系统，支持中英文切换。', NOW());

INSERT INTO t_news (title, content, publish_date) 
VALUES ('系统功能说明', '本系统支持电影、分类和新闻的增删改查功能，所有数据都存储在MySQL数据库中。', NOW());

INSERT INTO t_news (title, content, publish_date) 
VALUES ('最新更新计划', '即将支持超大文件分片上传功能，敬请期待！', NOW());

-- Insert default admin user
INSERT INTO user (username, password, role) VALUES ('admin', 'admin123', 'admin');

-- 【新增】插入观众测试账号
INSERT INTO user (username, password, role) VALUES ('viewer', '123456', 'user');
-- Insert sample carousel items (Assuming images exist or act as placeholders)
-- INSERT INTO t_carousel (image_url, target_url, title, sort_order, is_visible) VALUES ('static/images/hero1.jpg', 'user/movie_view?id=1', 'Classic: Shawshank Redemption', 1, TRUE);
