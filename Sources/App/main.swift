import Vapor
import VaporPostgreSQL


let drop = Droplet(
	providers: [VaporPostgreSQL.Provider.self]
)

drop.get("version") { reqest in
	if let db = drop.database?.driver as? PostgreSQLDriver {
		let version = try db.raw("SELECT version()")
		return try JSON(node: version)
	} else {
		return "No db connection"
	}
//	return let

}

drop.get { req in
    return try drop.view.make("welcome", [
    	"tagline": drop.localization[req.lang, "welcome", "tagline"]
    ])
}

drop.resource("posts", PostController())

drop.run()
