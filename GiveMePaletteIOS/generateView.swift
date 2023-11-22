//
//  generateView.swift
//  GiveMePaletteIOS
//
//  Created by SoundWave2847 on 14/11/23.
//

import SwiftUI
import ActivityIndicatorView

class colorViewModel : ObservableObject {
    @Published var colorList : [colorModel] = []
    @Published var isNotLoaded = true;
    
    func generateList() {
        isNotLoaded = true
        
        let generateCount = getTotalGenerateCount()
        let randomColorList = generateRandomHexList(length: generateCount < 1 ? 5 : generateCount)
  
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
        if(randomColorList.count > 0 ) {
            self.colorList.removeAll()
        }
        for color in randomColorList {
            
            self.colorList.append(colorModel(bgColor: hexStringToUIColor(hex: color), hexCode: color, isSaved: false, name: "Colors"))
        }
        
     
            self.isNotLoaded = false
            
        }
    
        
    }
    

    
    
}

struct generateView: View {
    @ObservedObject private var ViewModel = colorViewModel()
    
    @State private var scale = 1.0
    @State private var scale2 = 1.0
    @State private var showBottomSheet = false
    @State private var showBottomSheet2 = false
    @State private var selectedHexCode = ""
    
    func hideBottomSheet() {
        showBottomSheet = false
    }
    var body: some View {
        ZStack {
            Color("bgColor").ignoresSafeArea(.all)
            
            VStack {
                ScrollView {
                    ScrollView {
                        
                        ActivityIndicatorView(isVisible: $ViewModel.isNotLoaded, type: .arcs(count: 1, lineWidth: 3.0))
                            .frame(width: 50, height: 35).padding()
                        
                        ForEach(ViewModel.colorList) {color in
                            colorTile(colorModel: color)
                                .onTapGesture {
                                    showBottomSheet2.toggle()
                                    selectedHexCode = color.hexCode
                                }
                                .sheet(isPresented: $showBottomSheet2, content: {
                                    GenerateColorBottomSheet(dismiss: {
                                        showBottomSheet2 = false
                                    }, removeColor: {
                                        ViewModel.colorList.removeAll(where: { $0.hexCode == selectedHexCode })
                                        decreaseGenerateCount()
                                        showBottomSheet2 = false
                                        
                                    }, addColor: {
                                        let colorList = generateRandomHexList(length: 1)
                                        for color in colorList {
                                            
                                            ViewModel.colorList.append(colorModel(bgColor: hexStringToUIColor(hex: color), hexCode: color, isSaved: false, name: "Colors"))
                                        }
                                        
                                        increaseGenerateCount()
                                        showBottomSheet2 = false
                                    }, saveColor: {
                                        saveColor(color: selectedHexCode)
                                        showBottomSheet2 = false
                                    }, copyColor: {
                                        UIPasteboard.general.setValue(color.hexCode, forPasteboardType: "public.plain-text")
                                        showBottomSheet = false
                                    })
                                    .presentationDetents([.height(440),.medium])
                                })
                            
                        }
                    }
                    
                    Spacer().frame(height: 50)
                    
                    HStack {
                        Button(action: {
                            self.scale = 1.4
                            
                            withAnimation(Animation.spring().delay(0.2)) {
                                self.scale = 1
                                showBottomSheet.toggle()
                            }
                        }, label: {
                            Text("Save").frame(width: 78)
                                .font(.system(size: 20, weight: .semibold))
                        }).padding().padding(.bottom, 6).background(
                            Image("btnBgEnabled")
                                .resizable()
                                .edgesIgnoringSafeArea(.all)
                                .frame(height: 58))
                        .foregroundColor(.black)
                        .scaleEffect(scale)
                        .animation(.linear, value: scale)
                        .buttonStyle(NoTapAnimationStyle())
                        
                        Spacer().frame(width: 20)
                        
                        Button(action: {
                            ViewModel.generateList()
                            
                            withAnimation(Animation.spring().delay(0.2)) {
                                
                                
                                
                            }
                        }, label: {
                            Text("Generate").frame(width: 114)
                                .font(.system(size: 20, weight: .semibold))
                        }).padding().padding(.bottom, 6).background(
                            Image("btnBgEnabled")
                                .resizable()
                                .edgesIgnoringSafeArea(.all)
                                .frame(height: 58))
                        .foregroundColor(.black)
                        .scaleEffect(scale2)
                        .animation(.linear, value: scale2)
                        .buttonStyle(NoTapAnimationStyle())
                        
                    }
                    Spacer().frame(height: 50)
                }
            }
            .sheet(isPresented: $showBottomSheet, content: {
                saveBottomSheet(colorList: ViewModel.colorList, dismiss: hideBottomSheet)
                    .presentationDetents([.height(390),.medium])
            })
            
            
        }.onAppear(perform: {
            ViewModel.generateList()
        })
        }
    }



struct colorTile : View {
    var colorModel : colorModel;
    @State private var showBottomSheet = false
    
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
                        colorModel.changeIsSaved(saved: colorModel.isSaved == true ? false : true)
                    }
                
                
            }.padding(.horizontal, 16)
                
           
        }.frame(height: 132)
       
         
    }
}

#Preview {
    generateView()
}
