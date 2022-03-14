//
//  food.swift
//  fastmenu
//
//  Created by João Victor Ipirajá de Alencar on 14/03/22.
//

import Foundation
import CoreML
import ConsoleKit

class food: food_classifier{
    
    convenience init(config: MLModelConfiguration) throws{
        self.init()
        try super.init(configuration: config)
    }
    
    

}
