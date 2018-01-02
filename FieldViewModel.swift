//
//  VSC
//
//  Created by Farrah Aymen
//  Copyright © 2017 VSCT. All rights reserved.
//

// FieldViewModel
protocol VSFieldViewModel {
    
    var title: String { get}
    
    var value: Variable<String> { get set }
    var errorValue: Variable<String?> { get}
    var errorMessage: String { get }

    func validate() -> Bool
}

extension VSFieldViewModel {
    func validateSize(_ value: String, size: (min:Int, max:Int)) -> Bool {
        return (size.min...size.max).contains(value.count)
    }
    func validateString(_ value: String?, pattern: String) -> Bool {
        let test = NSPredicate(format:"SELF MATCHES %@", pattern)
        return test.evaluate(with: value)
    }
}
