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
    @State private var image: Image?
    @State private var inputImage: UIImage?
   
    
    
    var body: some View {
        NavigationView{
            
            VStack{
                if (image == nil) {
                    Image(uiImage: (UIImage(named: "camera-icon"))!)
                                        .resizable()
                                        .frame(width: 120, height: 120)
                } else {
                    image?
                    .resizable()
                    .scaledToFit()
                }
                
                
                Button("choose picture"){
                    self.showSheet = true
                    
                }.padding()
                .actionSheet(isPresented: $showSheet) {
                    ActionSheet(title: Text("Select Photo"), message: Text("choose"), buttons: [.default(Text("Photo Library")){
                        
                        self.showImagePicker = true
                    },
                    .default(Text("Camera")){
                        
                        self.showImagePicker = true
                        
                    },
                    .cancel()
                    ])
                    
                
            }
            
            .navigationBarTitle("MyProfile")
            }.sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                ImagePicker(image: self.$inputImage)
            }
            
    }
        
        }
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
        
        
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
