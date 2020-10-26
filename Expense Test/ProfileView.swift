//
//  ProfileView.swift
//  Expense Test
//
//  Created by Bethany Hull on 10/24/20.
//  Copyright © 2020 Bethany Hull. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var showSheet:Bool = false
    @State private var showImagePicker: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    
    @State private var image: UIImage?
    
    
    var body: some View {
        NavigationView{
            
            VStack{
                
                Image(uiImage: ((image ?? UIImage(named: "camera-icon"))!))
                    .resizable()
                    .frame(width: 120, height: 120)
                
                Button("choose picture"){
                    self.showSheet = true
                    
                }.padding()
                .actionSheet(isPresented: $showSheet) {
                    ActionSheet(title: Text("Select Photo"), message: Text("choose"), buttons: [.default(Text("Photo Library")){
                        
                        self.showImagePicker = true
                        self.sourceType = .photoLibrary
                    },
                    .default(Text("Camera")){
                        
                        self.showImagePicker = true
                        self.sourceType = .camera
                    },
                    .cancel()
                    ])
                    
                
            }
            
            .navigationBarTitle("MyProfile")
            }.sheet(isPresented: $showImagePicker) {
                ImagePicker(image: self.$image, isShown: self.$showImagePicker, sourceType: self.sourceType)
            }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

struct ContentView: View {
    var body: some View {
        Image("fall-leaves")
            .resizable()
            .scaledToFit()
    }
}


}
