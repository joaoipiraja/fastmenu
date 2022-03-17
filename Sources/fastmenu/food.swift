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
    
    
    var smallSize:Float
    var bigSize:Float
    
    
    func add(by label: String){
       let food_type = FoodTypes(rawValue: label) ?? FoodTypes.none
        
        switch food_type{
        case .chicken:
            self.smallSize = 16.0
            self.bigSize = 25.0
        case .red_meat:
            self.smallSize = 19.0
            self.bigSize = 28.0
        case .fish:
            self.smallSize = 20.0
            self.bigSize = 30.0
        case .vegetarian:
            self.smallSize = 16.0
            self.bigSize = 25.0
        case .none:
            self.smallSize = Float.nan
            self.bigSize = Float.nan
        }
        
        
    }
    
    init(){
        self.smallSize = Float.nan
        self.bigSize = Float.nan
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






class Menu: CustomStringConvertible{
    
    private let menuHeader =
    "\n🌸 Bom dia, nosso cardápio de hoje é:\n\n"
    
    private let menuBaseBoard = """
    
    Aos interessados, favor confirmar seu pedido!
    -----
    Aceitamos pagamento por PIX
    🔑  (85)998159740
    🔑  najlaipiraja@hotmail.com
    -----
    Disponíveis de 11:30 ~ 12:30 no APT 1004 T1.
    """
    
    private var items: Array<MenuItem>
    var menuInput:String
    

    init(menuInput: String){
        self.items = Array()
        self.menuInput = menuInput
        self.split_menu()
    }
    
    
    private func split_menu(){
        
        //Arroz branco;Feijão verde;Batata doce cozida;Sobrecoxa tradicional assada no forno ou omelete de queijo
        //Arroz branco;Feijão verde;Batata doce cozida;Sobrecoxa tradicional assada
        //Arroz branco;Feijão verde;Batata doce cozida;Omelete de queijo
        
        var menu_aux = self.menuInput.components(separatedBy: [";", "\n"])
        var main_dish = (menu_aux.last ?? "ou").components(separatedBy: "ou")
        
        main_dish.forEach { md in
            var content = menu_aux.map{$0.removeSpaces().capitalizingFirstLetter()}
            content.removeLast()
            content.append(md.removeSpaces().capitalizingFirstLetter())
            let contentString = content.joined(separator: ";")
            items.append(MenuItem(content: contentString ))
        }
        
    }
    
    
    var description: String {
        return
        
        menuHeader +
        
        items.reduce("", { first, second in
            let price = second.generate()
            return first + String(format:"\n%@ \n*PEQUENO* - R$ %.2f | *GRANDE* - R$ %.2f\n\n", second.content, price.smallSize, price.bigSize)
        })
        
        + menuBaseBoard
    }
    
    
    
    
}
