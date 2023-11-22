//
//  colorModel.swift
//  GiveMePaletteIOS
//
//  Created by SoundWave2847 on 22/11/23.
//

import Foundation
import UIKit
import SwiftUI

class colorModel : Identifiable {
    var id: String {
        self.hexCode
       }
    @State var bgColor: UIColor ;
    @State var hexCode : String;
    @State var isSaved : Bool;
    @State var name : String = "";

    init(bgColor: UIColor, hexCode: String, isSaved: Bool, name: String) {
        self.bgColor = bgColor
        self.hexCode = hexCode
        self.isSaved = isSaved
        self.name = name
    }
    
    func changeIsSaved(saved : Bool) {
        self.isSaved = saved
    }
    
}


class colorPaletteModel : Identifiable {
    var id: String {
        self.hexCode
       }
    @State var hexCode : String;
    @State var name : String;

    init(hexCode: String, name: String) {
        self.hexCode = hexCode
        self.name = name
    }
 
    
}
