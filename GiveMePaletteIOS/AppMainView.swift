//
//  AppMainView.swift
//  GiveMePaletteIOS
//
//  Created by SoundWave2847 on 08/11/23.
//

import SwiftUI

struct AppMainView: View {
    
    let homeView_ = HomeView()
    let generateView_ = generateView()
    let savedView_ = savedView()
    var selectedTab : any Hashable = "1"
    
    init() {
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .medium)], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .medium)], for: .selected)
    }
    var body: some View {
        
        ZStack {
            Color(Color.blue).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            TabView {
                
                HomeView()
                    .tabItem {
                        VStack {
                            Image(systemName: "house")
                            Text("Home")
                                .font(.system(size: 22))
                        }
                    }
                    
                    
                generateView()
                    .tabItem {
                        VStack {
                            Image(systemName: "pencil.slash")
                            Text("Generator")
                                .font(.system(size: 22))
                        }
                    }
    
                    
                savedView()
                    .tabItem {
                        VStack {
                            Image(systemName: "bookmark.fill")
                            Text("Saved")
                                .font(.system(size: 22))
                        }
                    }
    
                
                
            }
            .accentColor(.black)
    
        }

    }
}

enum TabViewItemType: String {
    case login  = "login"
    case home   = "home"
    case search = "search"

    var image: Image {
        switch self {
        case .login:  return Image("login")
        case .home:   return Image("home")
        case .search: return Image("search")
        }
    }

    var text: Text {
        Text(self.rawValue)
    }
}

#Preview {
    AppMainView()
}
