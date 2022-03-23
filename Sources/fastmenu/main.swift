import ConsoleKit
import ArgumentParser


//swift run fastmenu --service-time "12:30 ~ 13:00" --copy-to-paste-board

extension FastMenu{
    
    mutating func run() throws{
       let menu = Menu(serviceTime: self.serviceTime)
        
        Console.print("\(.brightRed)Digite o cardápio >>\(.reset)")

        while(true){
            if let input = Console.readLine(), !input.isEmpty{
                menu.split_menu(menuInput: input)
            }else{
                break
            }
            
            Console.print("\(.brightRed)Digite ENTER para sair >>\(.reset)")
        }
        
        
        if copyToPasteBoard{
            Console.print("\(.green)\(.bold)\n-----COPIED TO PASTEBOARD------\n\(.reset)")
            menu.description.copyToPasteboard()
        }else{
            Console.print("\n-----------\n")
        }
        
    
        
        Console.writeLine(menu.description)
    }

    
}


struct FastMenu: ParsableCommand{
    
    static var configuration = CommandConfiguration(
            abstract: "Generate your menus easier than ever",
            version: "1.0.0"
    )
    

    @Flag(help: "Copy output to pasteboard")
    var copyToPasteBoard = false
    
    @Option(help: "Time interval of service")
    var serviceTime = "11:30 ~ 12:30"
        
}

FastMenu.main()





    
