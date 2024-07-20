extends Resource

enum BUFF_TYPE {
	ADD_HP,
	MOVE_FAST,
	
	MAIN_SHOOT_FAST,
	MAIN_ADD_DAMAGE,
	MAIN_ADD_BULLET_HIT,
	
	ADD_TINY_GUN,
	TINY_GUN_ADD_DAMAGE,
	TINY_GUN_SHOOT_FAST,
	TINY_GUN_ADD_HIT,
}

const BUFF_DATA = {
	BUFF_TYPE.MAIN_SHOOT_FAST : {
		type = BUFF_TYPE.MAIN_SHOOT_FAST,
		txt = '主武器射速 + 50%',
		count = 5,
		weight = 10,
	},
	BUFF_TYPE.MAIN_ADD_DAMAGE : {
		type = BUFF_TYPE.MAIN_ADD_DAMAGE,
		txt = '主武器伤害 + 50%',
		count = 6,
		weight = 10,
	},
	BUFF_TYPE.ADD_HP : {
		type = BUFF_TYPE.ADD_HP,
		txt = 'HP + 500',
		count = 2,
		weight = 10,
	},
	BUFF_TYPE.MOVE_FAST : {
		type = BUFF_TYPE.MOVE_FAST,
		txt = '移动速度 + 50%',
		count = 5,
		weight = 10,
	},
	BUFF_TYPE.MAIN_ADD_BULLET_HIT : {
		type = BUFF_TYPE.MAIN_ADD_BULLET_HIT,
		txt = '主武器穿透 + 1',
		count = 2,
		weight = 5,
	},
	BUFF_TYPE.ADD_TINY_GUN : {
		type = BUFF_TYPE.ADD_TINY_GUN,
		txt = '添加副武器\n小枪',
		count = 1,
		weight = 50,
		precondition = []
	},
	BUFF_TYPE.TINY_GUN_ADD_DAMAGE : {
		type = BUFF_TYPE.ADD_TINY_GUN,
		txt = '小枪伤害 + 50%',
		count = 1,
		weight = 50,
		precondition = [BUFF_TYPE.ADD_TINY_GUN]
	},
	BUFF_TYPE.TINY_GUN_SHOOT_FAST : {
		type = BUFF_TYPE.ADD_TINY_GUN,
		txt = '小枪射速 + 50%',
		count = 1,
		weight = 50,
		precondition = [BUFF_TYPE.ADD_TINY_GUN]
	},
	BUFF_TYPE.TINY_GUN_ADD_HIT : {
		type = BUFF_TYPE.ADD_TINY_GUN,
		txt = '小枪穿透 + 1',
		count = 1,
		weight = 50,
		precondition = [BUFF_TYPE.ADD_TINY_GUN]
	},
}
