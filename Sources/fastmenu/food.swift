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
        let bundle = Bundle(url: Bundle.main.bundleURL.appendingPathComponent("fastmenu_fastmenu.bundle"))!
        let modelURL = bundle.url(forResource: "food_classifier", withExtension: "mlmodelc")!
        try! self.init(contentsOf: modelURL, configuration: .init())
        self.content = content
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
        return
        
        "🌸 Bom dia, nosso cardápio de hoje é:\n\n" +
        
        items.reduce("", { first, second in
            let price = second.generate()
            return first + String(format:"%@ \n*PEQUENO* - R$ %.2f | *GRANDE* - R$ %.2f\n", second.content, price.small_size, price.big_size)
        })
        
        + """
        Aos interessados, favor confirmar seu pedido!
        -----
        Aceitamos pagamento por PIX
        🔑  (85)998159740
        🔑  najlaipiraja@hotmail.com
        -----
        Disponíveis de 11:30 ~ 12:30 no APT 1004 T1.
        """
    }
}

class Menu{
    
    
    private var items: Array<MenuItem>
    var menu_input:String
    
    
    private func split_menu(){
        
        var menu_aux = self.menu_input.components(separatedBy: [";", "\n"])
        let menu_main_dish = (menu_aux.last ?? "ou").components(separatedBy: "ou")
        
        //return menu_aux.removeLast().reduce.
        
    }
    
    init(menu_input: String){
        self.items = Array()
        self.menu_input = menu_input
    }
    
    
}
