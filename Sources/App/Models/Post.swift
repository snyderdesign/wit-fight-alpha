import Vapor
import Fluent
import Foundation

final class Post: Model {
    var id: Node?
    var content: String
    
    init(content: String) {
        self.id = UUID().uuidString.makeNode()
        self.content = content
    }

    init(node: Node, in context: Context) throws {
        id = try node.extract("id")
        content = try node.extract("content")
    }

    func makeNode(context: Context) throws -> Node {
        return try Node(node: [
            "id": id,
            "content": content
        ])
    }
}

extension Post {
    /**
        This will automatically fetch from database, using example here to load
        automatically for example. Remove on real models.
    */
    public convenience init?(from string: String) throws {
        self.init(content: string)
    }
}

extension Post: Preparation {
    static func prepare(_ database: Database) throws {
        //
    }

    static func revert(_ database: Database) throws {
        //
    }
}

final class Fight {
	var id: Node?
	var user1: Int
	var user2: Int
	var title: String
	var one: Argument?
	var two: Argument?
	var three: Argument?
	var four: Argument?
	var five: Argument?
	var six: Argument?
	var seven: Argument?
	var eight: Argument?
	var nine: Argument?
	var ten: Argument?
	
	init(user1: Int, user2: Int, title: String) {
		self.user1 = user1
		self.user2 = user2
		self.title = title
	}
	//	init(node: Node, in context: Context) throws {
	//		id = try node.extract("id")
	//		namer = try node.extract("name")
	//	}
	
	static func prepare(_ database: Database) throws {
		try database.create("fights") { users in
			users.id()
			users.string("name")
		}
	}
	static func returnList() -> [Fight] {
		let fight1 = Fight(user1: 289, user2: 562, title: "BitchWHAAAT")
		let fight2 = Fight(user1: 432, user2: 676, title: "Chaz Drinks Coke")
		let fight3 = Fight(user1: 999, user2: 902, title: "Turn down for")
		let fight4 = Fight(user1: 969, user2: 696, title: "Ethical implications of the treaty of 1862")
		return [fight1, fight2, fight3, fight4]
	}
}



final class Argument {
	var theArgument: String
	var link: String
	
	init(phrase: String, link: String) {
		self.theArgument = phrase
		self.link = link
	}
}

