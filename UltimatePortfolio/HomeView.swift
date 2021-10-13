//
//  HomeView.swift.swift
//  HomeView.swift
//
//  Created by maartz on 13/10/2021.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var dataController: DataController
    
    var body: some View {
        NavigationView{
            VStack{
                Button("Add Data"){
                    dataController.deleteAll()
                    try? dataController.createSampleData()
                }
            }
            .navigationTitle("Home")
        }
    }
}

struct HomeViewPreviews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
