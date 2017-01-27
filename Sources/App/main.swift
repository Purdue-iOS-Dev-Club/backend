import Vapor

let drop = Droplet()

drop.get { req in
    return JSON(["Status": "Success"])
}

drop.run()
