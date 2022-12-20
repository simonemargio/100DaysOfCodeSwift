func exercise() {

    struct User {
      var name: String
      var email: String?
      var followers: Int
      var isActive: Bool

      func logStatus(){
        if (self.isActive == true) {
          print("\(self.name) is working hard.")
        } else {
          print("\(self.name) has left earth")
        }
      }
    }

    let user = User(name: "Ricard", email: nil, followers: 0, isActive: false)
    user.logStatus()

    print("\nDiagnostic code (i.e., Challenge Hint):")
    var musk = User(name: "Elon", email: "elon@tesla.com", followers: 2001, isActive: true)
    musk.logStatus()
    print("Contacting \(musk.name) on \(musk.email!) ...")
    print("\(musk.name) has \(musk.followers) followers")
    // sometime later
    musk.isActive = false
    musk.logStatus()
    
}

exercise()