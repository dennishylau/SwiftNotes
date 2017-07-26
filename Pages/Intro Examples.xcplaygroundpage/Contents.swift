//:## For Loop
// Example 1
let shouldMascotChangeVotes: [Bool] = [false, false, false, true, false, true, true, true, false, true, true, true, true, false, true, true, false, true, true, true, false, true, true, true, true, true, true, true, false, true, false, true, false, true, true, false, false, true, true, false, false, true, true, true, false, true, false, true, true, false, true, true, false, true, false, false, true, false, true, true, false, false, true, false, true, true, true, false, true, true, false, false, true, false, true, true, false, false, false, true, false, true, true, false, true, true, true, true, true, true, true, false, true, false, true, false, true, true, true, true, true, true, true, false, true, true, false, true, true, true, true, true, true, true, false, true, true, false, true, true, false, true, true, true, true, true, false, false, false, false, true, true, true, false, true, true, false, false, true, false, false, true, true, true, true, false, true, true, true, true, false, true, true, false, true, false, false, true, true, false, true, false, false, false, true, false, false, false, true, false, true, true, false, true, true, false, true, true, true, false, false, false, true, false, true, false, true, true, true, true, false, true, false, false, true, true, true, true, true, false]

func tallyVotes(votingTopic: [Bool]) {
	var yesCount = Int()
	var noCount = Int()
	
	for vote in votingTopic {
		if vote == true {
			yesCount += 1
		} else if vote == false {
			noCount += 1
		}
	}
	print("Vote yes: \(yesCount)")
	print("Vote no: \(noCount)")
	
	if yesCount > noCount {
		print("Motion passed.")
	} else if yesCount < noCount {
		print("Motion rejected.")
	} else {
		print("Draw.")
	}
}
tallyVotes(votingTopic: shouldMascotChangeVotes)
// VOTE takes every observation within the SHOULDMASCOTCHANGEVOTES array, compare Bool value and decide which Var to add to
//:---
// Example 2
// This counts the matches of a specific value within the array

let goalArray: [Double] = [65, 654, 5.6, 12.1, 65.8, 87.4, 987.1, 65.4, 45.654, 64.65, 87.3, 79.65, 87.13, 879.465, 789.13, 97.32, 798.312, 78, 84, 31, 78, 13, 465, 185, 86, 132, 79, 16, 8, 84, 87.3, 987, 321, 156, 654, 564, 77]

let goalArrayCount = goalArray.count
func matchGoal(k: Double) {
	var i = 0
	for goal in goalArray {
		if goal == k {
			i += 1
		}
	}
	func pluralMatch() -> String {
		if i > 1 {
			return "matches"
		} else {
			return "match"
		}
	}
	print("\(i) \(pluralMatch()) found")
}
matchGoal(k: 87.3)



// Example 3
// This comments on every array item depending on its value

func compareGoal(k: Double) {
	for goal in goalArray {
		if goal == k {
			print("\(goal) is just right.")
		} else if goal > k {
			print("\(goal) is too much")
		} else if goal < k {
			print("\(goal) is too little")
		}
	}
}
compareGoal(k: 87.3)
//:---
//:## Struct & Enumeration
// Example 1

enum Team {
    case team_a, team_b, team_c
}
enum Position{
    case quaterback, seeker, pitcher
}

struct Player {
    let name: String
    var skillLevel: Int
    var team: Team
    var position: Position
}

let player1 = Player(name: "Dennis Lau", skillLevel: 5, team: .team_a, position: .pitcher)
//:---
//:## Enumeration & Switch: Methods & Properties
// Example 1
enum Suit {
    case spades, hearts, diamonds, clubs
    
    var rank: Int {
        switch self {
        case .spades: return 4
        case .hearts: return 3
        case .diamonds: return 2
        case .clubs: return 1
        }
    }
    
    var emoji: String {
        switch self {
        case .clubs:
            return "♣️"
        case .diamonds:
            return "♦️"
        case .hearts:
            return "♥️"
        case .spades:
            return "♠️"
        }
    }
    
    
    func beats(_ otherSuit: Suit) -> Bool {
        return self.rank > otherSuit.rank
    }
}

let oneSuit = Suit.spades
let otherSuit = Suit.clubs
oneSuit.emoji
otherSuit.emoji
oneSuit.beats(otherSuit)
oneSuit.beats(oneSuit)
