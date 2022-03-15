//
//  food.swift
//  fastmenu
//
//  Created by João Victor Ipirajá de Alencar on 14/03/22.
//

import Foundation
import CoreML
import ConsoleKit


enum FoodTypes: String{
    case chicken = "FRANGO"
    case red_meat = "CARNE VERMELHA"
    case fish = "PEIXE"
    case vegetarian = "OVO-LACTO VEGETARIANO"
    case none
}




class Price{
    
    
    var small_size:Float
    var big_size:Float
    
    
    func add(by label: String){
       let food_type = FoodTypes(rawValue: label) ?? FoodTypes.none
        
        switch food_type{
        case .chicken:
            self.small_size = 0.0
            self.big_size = 0.0
        case .red_meat:
            self.small_size = 0.0
            self.big_size = 0.0
        case .fish:
            self.small_size = 0.0
            self.big_size = 0.0
        case .vegetarian:
            self.small_size = 0.0
            self.big_size = 0.0
        case .none:
            self.small_size = Float.nan
            self.big_size = Float.nan
        }
        
        
    }
    
    init(){
        self.small_size = Float.nan
        self.big_size = Float.nan
    }
    
}


class MenuItem: food_classifier {
    
    var content:String = ""
        
//
//    init(content:String){
//        self.content = content
//        let bundle = Bundle(url: Bundle.main.bundleURL.appendingPathComponent("fastmenu_fastmenu.bundle"))!
//        let modelURL = bundle.url(forResource: "food_classifier", withExtension: "mlmodelc")!
//        try! super.init(contentsOf: modelURL, configuration: .init())
//    }
    
    convenience init(content:String) {
        self.content = content
        let bundle = Bundle(url: Bundle.main.bundleURL.appendingPathComponent("fastmenu_fastmenu.bundle"))!
        let modelURL = bundle.url(forResource: "food_classifier", withExtension: "mlmodelc")!
        try! self.init(contentsOf: modelURL, configuration: .init())
    }
    
    
    func generate() -> Price {
        
        let price = Price()
        
        guard let food_label = try? super.prediction(text: self.content) else{
            fatalError("Unexpected runtime error.")
        }
        
        price.add(by: food_label.label)
        
        return price
    }
    
}

extension Menu: CustomStringConvertible{
    var description: String {
        return items.reduce("", { first, second in
            
            first + "{}"
        })
    }
}

class Menu{
    private var items: Array<MenuItem>
    
    
    init(){
        self.item = Array()
    }
    
    
}
