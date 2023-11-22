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

func increaseGenerateCount() {
    var count = getTotalGenerateCount()
    count = count + 1
    userDefs.setValue(count, forKey: "generateCount")


}
func decreaseGenerateCount() {
    var count = getTotalGenerateCount()
    count = count - 1
    userDefs.setValue(count, forKey: "generateCount")

}

    func removeColor(color : String) {
        var colors = getColors()

        colors.removeAll(where: { $0 == color })
        userDefs.setValue(colors, forKey: "colors")
    }
    
    func removeColorPalette(color : String) {
        var colors = getColorsPalette()
        print(colors.removeAll(where: { $0 == color }))
        
        userDefs.setValue(colors, forKey: "colorpalette")
    }
    
    func getColors() ->  [String] {
        let colors = userDefs.object(forKey: "colors") as? [String] ?? [String]()
        return colors;
    }
    
    func getColorsPalette() ->  [String] {
        let colors = userDefs.object(forKey: "colorpalette") as? [String] ?? [String]()
        return colors;
    }

func getTotalGenerateCount() ->  Int {
    let count = userDefs.object(forKey: "generateCount") as? Int ?? Int()
    print(count)
    if count >= 0 {
        return count;
    }
    else {
        return 5
    }

}
    
