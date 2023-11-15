//
//  HomeView.swift
//  GiveMePaletteIOS
//
//  Created by SoundWave2847 on 08/11/23.
//

import SwiftUI

struct HomeView: View {
    
    @State var addedHex : String = ""
    @State var rgbColor : String = ""
    @State private var scale = 1.0
    @State private var scale2 = 1.0
    var body: some View {
        ZStack {
            addedHex.count > 5 ?
            Color(uiColor: hexStringToUIColor(hex: "#\(addedHex)")).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/) :
            Color("bgColor").edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
         
        VStack {
            HStack {
                
                Text("GIVEME.PALETTE").font(.system(size: 28, weight: .black))
                    .foregroundStyle(.black)
                
                Spacer()
                
                Image(systemName: "person.circle").resizable()
                    .foregroundColor(Color("iconGray"))
                    .frame(width: 36, height: 36)
            }
            
            Spacer().frame(height: 200)
            
            Section {
                HStack {
                    Image(systemName: "number").resizable()
                        .frame(width: 24, height: 24)
                    Spacer().frame(width: 12)
                    TextField(text: $addedHex, label:  {
                        
                        Text("hex")
                        
                    }).font(.system(size: 18, weight: .semibold))
                        .onReceive(addedHex.publisher.collect()) {
                            self.addedHex = String($0.prefix(6))
                            if(addedHex.count > 5) {
                                let rgb = hexStringToRGBA(hex: addedHex)
                                self.rgbColor = "rgb(\(String(format:"%.2f",rgb.red)),\(String(format:"%.2f", rgb.green)),\(String(format:"%.2f", rgb.red)))"
                            }
                            else {
                                self.rgbColor = ""
                            }
                        }
                }.padding().padding(.bottom, 6).background(
                    Image("fieldBg")
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                        .frame(height: 72))
                
                Spacer().frame(height: 20)
                HStack {
                    Image(systemName: "paintbrush.fill").resizable()
                        .frame(width: 24, height: 24)
                    Spacer().frame(width: 12)
                    
                    TextField(text: $rgbColor, label:  {
                        
                        Text("rgb()")
                        
                    }).font(.system(size: 18, weight: .semibold))
                        .onReceive(addedHex.publisher.collect()) {
                            self.addedHex = String($0.prefix(6))
                            
                        }
                }.padding().padding(.bottom, 6).background(
                    Image("fieldBg")
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                        .frame(height: 72))
            }
            
            Spacer().frame(height: 180)
            
            Section {
                HStack {
                    Button(action: {
                        self.scale = 1.4
                        
                        withAnimation(Animation.spring().delay(0.2)) {
                            self.scale = 1
                        }
                    }, label: {
                        Text("Save").frame(width: 78)
                            .font(.system(size: 20, weight: .semibold))
                    }).padding().padding(.bottom, 6).background(
                        Image(addedHex.count > 2  ? "btnBgEnabled" : "btnBg")
                            .resizable()
                            .edgesIgnoringSafeArea(.all)
                            .frame(height: 64))
                    .foregroundColor(addedHex.count > 2  ? .black : .gray)
                    .scaleEffect(scale)
                    .animation(.linear, value: scale)
                    .buttonStyle(NoTapAnimationStyle())
                    
                    
                    
                    
                    Button(action: {
                        self.scale2 = 1.4
                        
                        withAnimation(Animation.spring().delay(0.2)) {
                            self.scale2 = 1
                        }
                    }, label: {
                        Text("Clear").frame(width: 78)
                            .font(.system(size: 20, weight: .medium))
                    }).padding().padding(.bottom, 6)
                        .foregroundColor(addedHex.count > 2  ? .black : .gray)
                        .scaleEffect(scale2)
                        .animation(.linear, value: scale2)
                        .buttonStyle(NoTapAnimationStyle())
                    
                }
                
            }
            
            Spacer()
        }.padding()
        }
    }
}
struct NoTapAnimationStyle: PrimitiveButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            // Make the whole button surface tappable. Without this only content in the label is tappable and not whitespace. Order is important so add it before the tap gesture
            .contentShape(Rectangle())
            .onTapGesture(perform: configuration.trigger)
    }
}

#Preview {
    HomeView()
}
