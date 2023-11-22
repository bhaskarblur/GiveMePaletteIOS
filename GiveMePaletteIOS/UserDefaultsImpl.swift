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
 

    func removeColor(color : String) {
        var colors = getColors()
       if let index_ = colors.firstIndex(of: color) {
            colors.remove(at: index_.hashValue as Int)
            userDefs.setValue(colors, forKey: "colors")
         }
    }
    
    func removeColorPalette(color : String) {
        var colors = getColors()
       if let index_ = colors.firstIndex(of: color) {
            colors.remove(at: index_.hashValue as Int)
            userDefs.setValue(colors, forKey: "colorpalette")
         }
    }
    
    func getColors() ->  [String] {
        let colors = userDefs.object(forKey: "colors") as? [String] ?? [String]()
        return colors;
    }
    
    func getColorsPalette() ->  [String] {
        let colors = userDefs.object(forKey: "colorpalette") as? [String] ?? [String]()
        return colors;
    }
    
