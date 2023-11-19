//
//  savedView.swift
//  GiveMePaletteIOS
//
//  Created by SoundWave2847 on 15/11/23.
//

import SwiftUI

struct savedView: View {
    @State private var scale = 1.0
    @State private var scale2 = 1.0
    @State var currentSelectedTab = 0
    
    @ObservedObject var _viewModel : _colorViewModel = _colorViewModel()
    
    init() {
        _viewModel.loadData();
    }
    var body: some View {
        ZStack {
            Color("bgColor").ignoresSafeArea(.all)
            
            VStack {
                Spacer().frame(height: 20)
                HStack {
                    Button(action: {
                        
                        self.scale = 1.4
                        currentSelectedTab = 0;
                        withAnimation(Animation.spring().delay(0.2)) {
                            self.scale = 1
             
                        }
                    }, label: {
                        Text("Colors").frame(width: 92)
                            .font(.system(size: 20, weight: .semibold))
                    }).padding().padding(.bottom, 6).background(
                        Image(currentSelectedTab == 0  ? "tabBg" : "tabBgDisabled")
                            .resizable()
                            .edgesIgnoringSafeArea(.all)
                            .frame(height: 58))
                    .foregroundColor(currentSelectedTab == 0  ? .black : .gray)
                    .scaleEffect(scale)
                    .animation(.linear, value: scale)
                    .buttonStyle(NoTapAnimationStyle())
                    
                    Button(action: {
                        self.scale2 = 1.4
                        currentSelectedTab = 1;
                        
                        withAnimation(Animation.spring().delay(0.2)) {
                            self.scale2 = 1
                 
                        }
                    }, label: {
                        Text("Palettes").frame(width: 108)
                            .font(.system(size: 20, weight: .semibold))
                    }).padding().padding(.bottom, 6).background(
                        Image(currentSelectedTab == 1 ? "tabBg" : "tabBgDisabled")
                            .resizable()
                            .edgesIgnoringSafeArea(.all)
                            .frame(height: 58))
                    .foregroundColor(currentSelectedTab == 1 ? .black : .gray)
                    .scaleEffect(scale2)
                    .animation(.linear, value: scale2)
                    .buttonStyle(NoTapAnimationStyle())
    
                }

             
                Spacer().frame(height: 30)
                
                if(currentSelectedTab == 0) {
                    colorsTab(colorList: _viewModel.colorList)
                }
                else {
                 colorsTab(colorList:  _viewModel.paletteList)
                }
              
                
            }
            
            }
    }
}

struct colorsTab : View {
    
    
    @State var colorList : [colorModel]
   
    init(colorList: [colorModel]) {
        self.colorList = colorList
    }
    var body: some View {
        
        ScrollView {
            ForEach(colorList) { color in
                _colorTile(colorModel: color)
                
            }
        }
    }
}
    

struct _colorTile : View {
    var _colorModel_ : colorModel;
    var rgb : rgba
    var hsl : Hsl
    var hslText : String
    var rgbText : String
    
    init(colorModel: colorModel) {
        self._colorModel_ = colorModel
        self.rgb = hexStringToRGBA(hex: colorModel.hexCode);
        self.hsl = hslFromColor(Color(red:  rgb.red, green:  rgb.green, blue: rgb.blue))
        self.rgbText = "rgb(\(String(format:"%.1f",rgb.red)),\(String(format:"%.1f", rgb.green)),\(String(format:"%.1f", rgb.red)))"
        self.hslText = "hsl(\(String(format:"%.1f",hsl.h)),\(String(format:"%.1f",hsl.s)),\(String(format:"%.1f",hsl.l)))"
    }
        
        var body : some View {
            
            ZStack {
                Color(uiColor: _colorModel_.bgColor )
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2)
                VStack {
                    HStack {
                        Text(_colorModel_.hexCode)
                            .foregroundStyle(.white)
                            .font(.system(size: 19, weight: .medium))
                        Spacer()
                        
                        Text(rgbText)
                            .foregroundStyle(.white)
                            .font(.system(size: 19, weight: .medium))
                        
                        
                    }.padding(.horizontal, 16)
                    
                    Spacer().frame(height: 45)
                    
                    
                    HStack {
                        Text(_colorModel_.name.isEmpty ? "Color" : _colorModel_.name)
                            .foregroundStyle(.white)
                            .font(.system(size: 19, weight: .medium))
                        
                        Spacer()
                        
                        Text(hslText)
                            .foregroundStyle(.white)
                            .font(.system(size: 19, weight: .medium))
                        
                        
                    }.padding(.horizontal, 16)
                }
               
            }.frame(height: 132)
        }
    }
    
    
    class _colorViewModel : ObservableObject {
        @Published var colorList : [colorModel] = []
        
        @Published var paletteList : [colorModel] = []
        
        func loadData() {
            
            if(colorList.count > 0){
                colorList.removeAll()
            }
            let savedColors = getColors();
            
            for color in savedColors {
                colorList.append(colorModel(bgColor: hexStringToUIColor(hex: color), hexCode: color, isSaved: true))
            }
        }
        
        init() {
           loadData()
        }
    }




#Preview {
    savedView()
}
