//
//  saveBottomSheet.swift
//  GiveMePaletteIOS
//
//  Created by SoundWave2847 on 17/11/23.
//

import SwiftUI

struct saveBottomSheet: View {
    @State private var scale = 1.0
    @State private var scale2 = 1.0
    @State private var name = ""
    @State private var desc = ""
    @State private var isSaved = false;
    private let colorList : [colorModel]
    private var dismiss : () -> Void
    
    init(colorList: [colorModel], dismiss: @escaping () -> Void) {
        self.colorList = colorList
        self.dismiss = dismiss
    }
    
    
    var body: some View {
        
        ZStack {
            Color("bgColor").edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack {
                Spacer().frame(height: 20)
                HStack {
                    Text("Create Palette")
                        .font(.system(size: 26, weight: .bold))
                        .frame(alignment: .leading)
                    
                    Spacer()
                    
                    Button(action: {
                        self.scale = 1.4
                        
                        withAnimation(Animation.spring().delay(0.2)) {
                            self.scale = 1
                            dismiss()
                        }
                    }, label: {
                        Text("X")
                            .font(.system(size: 20, weight: .bold))
                            .padding(.trailing, 2).padding(.bottom, 2)
                    }).padding().background(
                        Image("iconBg")
                            .resizable()
                            .edgesIgnoringSafeArea(.all)
                            .frame(height: 48))
                    .foregroundColor(.black)
                    .scaleEffect(scale)
                    .animation(.linear, value: scale)
                    .buttonStyle(NoTapAnimationStyle())
                    
                }
                .padding()
                
                
                Spacer().frame(height: 20)
                
                TextField(text: $name, label:  {
                    
                    Text("Title*").font(.system(size: 18, weight: .semibold))
                    
                }).font(.system(size: 18, weight: .semibold))
                .padding().padding(.bottom, 6).background(
                    Image("fieldBg")
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                        .frame(height: 72)).padding(.horizontal)
                
                Spacer().frame(height: 30)
                
                TextField(text: $desc, label:  {
                    
                    Text("Description").font(.system(size: 18, weight: .semibold))
                    
                })
                .padding().padding(.bottom, 6).background(
                    Image("fieldBg")
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                        .frame(height: 72)).padding(.horizontal)
                
                Spacer().frame(height: 50)
                
                
                Button(action: {
                    if(!name.isEmpty) {
                        for color_ in colorList {
                            saveColorPalette(color: (color_.hexCode))
                        }
                        
                        isSaved.toggle()
                    }
                    self.scale2 = 1.4
                    
                    withAnimation(Animation.spring().delay(0.2)) {
                        self.scale2 = 1
                    }
                }, label: {
                    Text("Save").frame(width: 96)
                        .font(.system(size: 20, weight: .semibold))
                }).padding().padding(.bottom, 6).background(
                    Image(name.count > 0  ? "btnBgEnabled" : "btnBg")
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                        .frame(height: 64))
                .foregroundColor(name.count > 2  ? .black : .gray)
                .scaleEffect(scale2)
                .animation(.linear, value: scale2)
                .buttonStyle(NoTapAnimationStyle())
                .alert(LocalizedStringKey("Color Palettes Saved"), isPresented: $isSaved, actions: {
                    Button(action: {
                        isSaved = false;
                        dismiss()
                    }, label: {
                        Text("OK") })
                }, message: {
                    Text("This color is saved, check saved tab to see saved colors.")
                })
                Spacer().frame(height: 20)
            }
            
        }
    }
}

#Preview {
    saveBottomSheet(colorList: [], dismiss: {
        
    })
}
