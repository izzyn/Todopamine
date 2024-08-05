extends Resource
class_name Task

enum Difficulty {
	EASY,
	MEDIUM,
	CHALLENGING,
	HARD
}

enum Type {
	DAILY,
	WEEKDAYS,
	WEEKENDS,
	WEEKLY,
	MONTHLY
}

var type : Type
var difficulty : Difficulty
var name : String
