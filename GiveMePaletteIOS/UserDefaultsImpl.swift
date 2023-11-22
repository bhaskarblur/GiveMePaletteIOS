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
        userDefs.setValue(colors, forKey: "colors")
      
     
    }

    func saveColorPalette(color : String) {
    var colors = getColorsPalette()
    colors.append(color)
    userDefs.setValue(colors, forKey: "colorpalette")


}
 

    func removeColor(index : Int) {
        var colors = getColors()
        colors.remove(at: index)
        userDefs.setValue(colors, forKey: "colors")
    }
    
    func removeColorPalette(index : Int) {
        var colors = getColorsPalette()
        colors.remove(at: index)
        userDefs.setValue(colors, forKey: "colors")
    }
    
    func getColors() ->  [String] {
        let colors = userDefs.object(forKey: "colors") as? [String] ?? [String]()
        return colors;
    }
    
    func getColorsPalette() ->  [String] {
        let colors = userDefs.object(forKey: "colorpalette") as? [String] ?? [String]()
        return colors;
    }
    
