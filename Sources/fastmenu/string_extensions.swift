//
//  File.swift
//  
//
//  Created by João Victor Ipirajá de Alencar on 17/03/22.
//

import Foundation

extension String
{
    func removeSpaces() -> String
   {
    return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
   }
    
    func capitalizingFirstLetter() -> String {
          return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
