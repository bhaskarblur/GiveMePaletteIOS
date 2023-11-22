//
//  GenerateColorBottomSheet.swift
//  GiveMePaletteIOS
//
//  Created by SoundWave2847 on 22/11/23.
//

import SwiftUI

struct GenerateColorBottomSheet: View {
    
    @State private var scale = 1.0
    @State private var scale2 = 1.0
    @State private var scale3 = 1.0
    @State private var scale4 = 1.0
    private var dismiss : () -> Void
    private var removeColor : () -> Void
    private var addColor : () -> Void
    private var saveColor : () -> Void
    private var copyColor : () -> Void

    init(scale: Double = 1.0, scale2: Double = 1.0, dismiss: @escaping () -> Void, removeColor: @escaping () -> Void, addColor: @escaping () -> Void, saveColor: @escaping () -> Void, copyColor: @escaping () -> Void) {
        self.scale = scale
        self.scale2 = scale2
        self.dismiss = dismiss
        self.removeColor = removeColor
        self.addColor = addColor
        self.saveColor = saveColor
        self.copyColor = copyColor
    }
    var body: some View {
        
        ZStack {
            Color("bgColor").edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack {
                Spacer().frame(height: 20)
                    
                Button(action: {
                    addColor()
                    self.scale = 1.4
                    
                    withAnimation(Animation.spring().delay(0.2)) {
                        self.scale = 1
                    }
                }, label: {
                    
                    HStack {
                      
                        Image(systemName: "plus")
                            .resizable().aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                            .frame(width: 26 , height: 26).foregroundColor(.black)
                      
                        Spacer().frame(width: 12)
                        Text("Add color").font(.system(size: 20, weight: .semibold))
                            .foregroundStyle(.black)
                        Spacer()
                        
                    }
                }).padding().padding(.bottom, 6).background(
                    Image("fieldBg")
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                        .frame(height: 72)).padding(.horizontal)
                    .foregroundColor(.black)
                    .scaleEffect(scale)
                    .animation(.linear, value: scale)
                    .buttonStyle(NoTapAnimationStyle())
                
                Spacer().frame(height: 20)
                Button(action: {
                    removeColor()
                    self.scale2 = 1.4
                    
                    withAnimation(Animation.spring().delay(0.2)) {
                        self.scale2 = 1
                    }
                }, label: {
                    
                    HStack {
                      
                        Image(systemName: "minus")
                            .resizable().aspectRatio(contentMode: .fit)
                            .frame(width: 26 , height: 26).foregroundColor(.black)
                      
                        Spacer().frame(width: 12)
                        Text("Remove color").font(.system(size: 20, weight: .semibold))
                            .foregroundStyle(.black)
                        Spacer()
                        
                    }
                }).padding().padding(.bottom, 6).background(
                    Image("fieldBg")
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                        .frame(height: 72)).padding(.horizontal)
                    .foregroundColor(.black)
                    .scaleEffect(scale2)
                    .animation(.linear, value: scale2)
                    .buttonStyle(NoTapAnimationStyle())
                
                Spacer().frame(height: 20)
                Button(action: {
                    saveColor()
                    self.scale3 = 1.4
                    
                    withAnimation(Animation.spring().delay(0.2)) {
                        self.scale3 = 1
                    }
                }, label: {
                    
                    HStack {
                      
                        Image(systemName: "heart")
                            .resizable().aspectRatio(contentMode: .fill)
                            .frame(width: 26 , height: 26).foregroundColor(.black)
                      
                        Spacer().frame(width: 12)
                        Text("Save color").font(.system(size: 20, weight: .semibold))
                            .foregroundStyle(.black)
                        Spacer()
                        
                    }
                }).padding().padding(.bottom, 6).background(
                    Image("fieldBg")
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                        .frame(height: 72)).padding(.horizontal)
                    .foregroundColor(.black)
                    .scaleEffect(scale3)
                    .animation(.linear, value: scale3)
                    .buttonStyle(NoTapAnimationStyle())
                
                Spacer().frame(height: 20)
                
                Button(action: {
                    copyColor()
                    self.scale4 = 1.4
                    
                    withAnimation(Animation.spring().delay(0.2)) {
                        self.scale4 = 1
                    }
                }, label: {
                    
                    HStack {
                      
                        Image(systemName: "doc.on.doc")
                            .resizable().aspectRatio(contentMode: .fill)
                            .frame(width: 26 , height: 26).foregroundColor(.black)
                      
                        Spacer().frame(width: 12)
                        Text("Copy color").font(.system(size: 20, weight: .semibold))
                            .foregroundStyle(.black)
                        Spacer()
                        
                    }
                }).padding().padding(.bottom, 6).background(
                    Image("fieldBg")
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                        .frame(height: 72)).padding(.horizontal)
                    .foregroundColor(.black)
                    .scaleEffect(scale4)
                    .animation(.linear, value: scale4)
                    .buttonStyle(NoTapAnimationStyle())
                
                Spacer().frame(height: 20)
                
                Text("Cancel").font(.system(size: 20, weight: .semibold))
                    .foregroundStyle(.black)
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
            
    }
}

#Preview {
    GenerateColorBottomSheet(scale: 1, scale2: 1, dismiss: {}, removeColor: {}, addColor: {}, saveColor: {}, copyColor: {})
}
