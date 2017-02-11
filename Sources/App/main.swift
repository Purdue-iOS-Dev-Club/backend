import Vapor
import VaporPostgreSQL
import HTTP

let drop = Droplet()
try drop.addProvider(VaporPostgreSQL.Provider.self)

drop.get { req in
    return JSON(["Status": "Success"])
}

drop.get("db_version") { request in
    if let db = drop.database?.driver as? PostgreSQLDriver {
        let version = try db.raw("SELECT Version()")
        return JSON(version)
    }
    return "Error connecting to db"
}

drop.run()
