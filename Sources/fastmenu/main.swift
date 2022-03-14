import CoreML
import ConsoleKit

let model: food_classifier? = {
    do {
        let config = MLModelConfiguration()
        return try food_classifier(configuration: config)
    }catch{
        Console.writeError("Could not open the model")
        return nil
    }
}()

Console.write("Output >> ")

if let model_aux = model{
if let menu_output = Console.readLine(){
    guard let food_label = try? model_aux.prediction(text: menu_output) else{
        Console.writeError("Could not predict ouput")
        fatalError("Unexpected runtime error.")
    }
    
    Console.writeLine(food_label.label)
}
}
