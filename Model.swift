//
//  VSC
//
//  Created by Farrah Aymen
//  Copyright © 2017 VSCT. All rights reserved.
//

// Model class : Signin (email, password)
class SigninModel {
    var email: String = ""
    var password: String = ""
    convenience init(email: String, password: String) {
        self.init()
        self.email = email
        self.password = password
    }
}
