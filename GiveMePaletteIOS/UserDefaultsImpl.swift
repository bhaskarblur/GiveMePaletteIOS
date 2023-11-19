//
//  UserDefaults.swift
//  GiveMePaletteIOS
//
//  Created by SoundWave2847 on 19/11/23.
//

import Foundation


    let userDefs = UserDefaults.standard;
    
    func saveColor(color : String) {
        var colors = getColors()
        colors.append(color)
        do {
            userDefs.setValue(colors, forKey: "colors")
        }
        catch let error  {
            print(error.localizedDescription)
        }
     
    }

    func removeColor(index : Int) {
        var colors = getColors()
        colors.remove(at: index)
        userDefs.setValue(colors, forKey: "colors")
    }
    
    func getColors() ->  [String] {
        let colors = userDefs.object(forKey: "colors") as? [String] ?? [String]()
        return colors;
    }
    
