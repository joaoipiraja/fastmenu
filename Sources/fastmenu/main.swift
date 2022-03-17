import CoreML
import ConsoleKit



Console.write("Digite o cardápio >> ")

if let input = Console.readLine(){
    Console.writeLine(Menu(menuInput: input).description)
}


    
