extends Resource

enum BUFF_TYPE {
	ADD_HP,
	MOVE_FAST,
	MAIN_SHOOT_FAST,
	MAIN_ADD_DAMAGE,
	MAIN_ADD_BULLET_HIT,
	ADD_TINY_GUN,
}

const BUFF_DATA = [
	{
		type = BUFF_TYPE.MAIN_SHOOT_FAST,
		txt = '主武器射速增加50%',
		count = 5,
		weight = 10,
	},
	{
		type = BUFF_TYPE.MAIN_ADD_DAMAGE,
		txt = '主武器伤害增加50%',
		count = 6,
		weight = 10,
	},
	{
		type = BUFF_TYPE.ADD_HP,
		txt = 'HP + 500',
		count = 2,
		weight = 10,
	},
	{
		type = BUFF_TYPE.MOVE_FAST,
		txt = '移动速度加快50%',
		count = 5,
		weight = 10,
	},
	{
		type = BUFF_TYPE.MAIN_ADD_BULLET_HIT,
		txt = '主武器穿透 + 1',
		count = 2,
		weight = 5,
	},
	{
		type = BUFF_TYPE.ADD_TINY_GUN,
		txt = '添加副武器\n小枪',
		count = 1,
		weight = 50,
		precondition = null
	},
]
