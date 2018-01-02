//
//  VSC
//
//  Created by Farrah Aymen
//  Copyright © 2017 VSCT. All rights reserved.
//


// Data FieldViewModel : Password
struct VSPasswordViewModel : VSFieldViewModel, VSSecureFieldViewModel {
    
    var value: Variable<String> = Variable("")
    var errorValue: Variable<String?> = Variable(nil)
    
    let title = "Password"
    let errorMessage = "Wrong password !"
    
    var isSecureTextEntry: Bool = true
    
    func validate() -> Bool {
        // between 8 and 25 caracters
        guard validateSize(value.value, size: (8,25)) else {
            errorValue.value = errorMessage
            return false
        }
        errorValue.value = nil
        return true
    }
}

// Options for FieldViewModel
protocol VSSecureFieldViewModel {
    var isSecureTextEntry: Bool { get }
}
