//
//  helperClass.swift
//  GiveMePaletteIOS
//
//  Created by SoundWave2847 on 14/11/23.
//

import Foundation
import UIKit
import SwiftUI

class rgba {
    var red : CGFloat
    var green : CGFloat
    var blue : CGFloat
    var alpha : CGFloat
    
    init(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }
}

class Hsl {
    var h : Double
    var s : Double
    var l : Double
    
    init(h: Double, s: Double, l: Double) {
        self.h = h
        self.s = s
        self.l = l
    }
    
}
func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }

    if ((cString.count) != 6) {
        return UIColor.gray
    }

    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)

    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}

func hexStringToRGBA (hex:String) -> rgba {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }

    if ((cString.count) != 6) {
        return .init(red: 0, green: 0, blue: 0, alpha: 1)
    }

    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)

    return rgba(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}


func hslFromColor(_ color: Color) -> Hsl {
    var h: CGFloat = 0.0
    var s: CGFloat = 0.0
    var l: CGFloat = 0.0

    let uiColor = UIColor(color)
    uiColor.getHue(&h, saturation: &s, brightness: &l, alpha: nil)

    return Hsl(h: Double(h), s: Double(s), l: Double(l))
}
