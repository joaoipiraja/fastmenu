//
//  File.swift
//  
//
//  Created by João Victor Ipirajá de Alencar on 17/03/22.
//

import Foundation
import AppKit


extension String
{
    
    func copyToPasteboard(){
        let pasteboard = NSPasteboard.general
        pasteboard.clearContents()
        pasteboard.setString(self.description, forType: .string)
        pasteboard.string(forType: .string)
    }
    
    func removeSpaces() -> String{
        return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
    }
    
    func capitalizingFirstLetter() -> String {
          return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
