//
//  generateView.swift
//  GiveMePaletteIOS
//
//  Created by SoundWave2847 on 14/11/23.
//

import SwiftUI

struct colorModel : Identifiable {
    var id: String {
        self.hexCode
       }
    @State var bgColor: UIColor ;
    @State var hexCode : String;
    @State var isSaved : Bool;
    
    init(bgColor: UIColor, hexCode: String, isSaved: Bool) {
        self.bgColor = bgColor
        self.hexCode = hexCode
        self.isSaved = isSaved
    }
}

class colorViewModel : ObservableObject {
    @Published var colorList : [colorModel] = [colorModel(bgColor: hexStringToUIColor(hex:"#2cabe1"), hexCode:"#2cabe1",
                                                          isSaved: true),
                                               colorModel(bgColor: hexStringToUIColor(hex:"#0d9e24"), hexCode:"#0d9e24",
                                                                                isSaved: false),
                                               colorModel(bgColor: hexStringToUIColor(hex:"#d01b5c"), hexCode:"#d01b5c",
                                                                                isSaved: false),
                                               colorModel(bgColor: hexStringToUIColor(hex:"#e2b412"),
                                                          hexCode:"#e2b412",
                                                                                isSaved: false), 
                                               colorModel(bgColor: hexStringToUIColor(hex:"#8F0BBD"), hexCode:"#8F0BBD",
                                                                                isSaved: false),
    ]
    
}

struct generateView: View {
    @ObservedObject var ViewModel = colorViewModel()
    @State private var scale = 1.0
    @State private var scale2 = 1.0
    var body: some View {
        ZStack {
            Color("bgColor").ignoresSafeArea(.all)
            
            VStack {
                ScrollView {
                    ScrollView {
                        ForEach(ViewModel.colorList) { color in
                            colorTile(colorModel: color)
                            
                        }
                        
                        Spacer().frame(height: 50)
                        
                        HStack {
                            Button(action: {
                                self.scale = 1.4
                                
                                withAnimation(Animation.spring().delay(0.2)) {
                                    self.scale = 1
                                }
                            }, label: {
                                Text("Save").frame(width: 78)
                                    .font(.system(size: 22, weight: .semibold))
                            }).padding().padding(.bottom, 6).background(
                                Image("btnBgEnabled")
                                    .resizable()
                                    .edgesIgnoringSafeArea(.all)
                                    .frame(height: 64))
                            .foregroundColor(.black)
                            .scaleEffect(scale)
                            .animation(.linear, value: scale)
                            .buttonStyle(NoTapAnimationStyle())
                            
                            Spacer().frame(width: 20)
                            
                            Button(action: {
                                self.scale2 = 1.4
                                
                                withAnimation(Animation.spring().delay(0.2)) {
                                    self.scale2 = 1
                                }
                            }, label: {
                                Text("Generate").frame(width: 114)
                                    .font(.system(size: 22, weight: .semibold))
                            }).padding().padding(.bottom, 6).background(
                                Image("btnBgEnabled")
                                    .resizable()
                                    .edgesIgnoringSafeArea(.all)
                                    .frame(height: 64))
                            .foregroundColor(.black)
                            .scaleEffect(scale2)
                            .animation(.linear, value: scale2)
                            .buttonStyle(NoTapAnimationStyle())
                            
                        }
                        Spacer().frame(height: 50)
                    }
                }
            }
        }
    }
}

struct colorTile : View {
    var colorModel : colorModel;
    
    init(colorModel: colorModel) {
        self.colorModel = colorModel
    }
    
    var body : some View {
        ZStack {
            Color(uiColor: colorModel.bgColor)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2)
            
            HStack {
                Text(colorModel.hexCode)
                    .foregroundStyle(.white)
                    .font(.system(size: 19, weight: .medium))
                Spacer()
                
                Image(systemName: colorModel.isSaved ? "lock.fill" : "lock.open.fill").resizable()
                    .foregroundColor(Color(uiColor: hexStringToUIColor(hex: "#242424")))
                    .frame(width:colorModel.isSaved ? 16 : 20, height:colorModel.isSaved ? 20 : 20)
                    .opacity(0.8)
                    .onTapGesture {
                        colorModel.isSaved.toggle()
                    }
                
                
            }.padding(.horizontal, 16)
                
           
        }.frame(height: 132)
    }
}

#Preview {
    generateView()
}
