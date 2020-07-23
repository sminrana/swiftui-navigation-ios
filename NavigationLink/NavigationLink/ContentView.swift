//
//  ContentView.swift
//  NavigationLink
//
//  Created by Smin Rana on 7/23/20.
//  Copyright © 2020 Smin Rana. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        // Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.orange]
        
        // Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.orange]
        
        UINavigationBar.appearance().tintColor = UIColor.orange
    }
    
    var body: some View {
        NavigationView {
            MasterView()
                .navigationBarTitle(
                    Text("Navigation Demo")
                )
            HomeView(menu: Menu(name:"Home",      image:"image",  destination:    .home))
        }.navigationViewStyle(DefaultNavigationViewStyle())
    }
}

struct MasterView: View {
    
    let  view1 =  Menu(name:"Home",      image:"image",  destination:    .home)
    let  view2 =  Menu(name:"View 1",          image:"image",  destination:    .view1)
    let  view3 =  Menu(name:"View 3",       image:"image",  destination:    .view2)

    var body: some View {
        let menus: [Menu] = [view1, view2, view3]

        return List {
            ForEach(menus) { menu in
                self.destinationView(menu: menu)
            }
        }
    }
    
    func destinationView(menu: Menu) -> some View {
        
        switch menu.destination {
            case .view1:
                return NavigationLink(
                    destination: AnyView(View1(menu: menu))
                )
                {
                    Text("\(menu.name)")
                }
            case .view2:
                   return NavigationLink(
                       destination: AnyView(View2(menu: menu))
                   )
                   {
                       Text("\(menu.name)")
                   }
            default:
               return NavigationLink(
                   destination: AnyView(HomeView(menu: menu))
               )
               {
                   Text("\(menu.name)")
               }
        }
        
    }
}

struct HomeView: View {
    var menu: Menu
    
    var body: some View {
        Text("Home View")
    }
}

struct View1: View {
    var menu: Menu
    
    var body: some View {
        Text("View 1")
    }
}

struct View2: View {
    var menu: Menu
    
    var body: some View {
        Text("View 2")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
