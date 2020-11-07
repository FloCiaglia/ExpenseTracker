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
    @State private var username: String = "Flo"
    @State private var income: String = "$3000"
   
    
    
    var body: some View {
        Text("Hello!!")
        NavigationView{

            VStack{
                
                Text("Name")
                    .font(.callout)
                    .bold()

                TextField("Enter your name", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle()).frame(width: 300, height: 50)

                Text("Income")
                    .font(.callout)
                    .bold()

                TextField("Enter your income", text: $income)
                    .textFieldStyle(RoundedBorderTextFieldStyle()).frame(width: 300, height: 50)

                if (image == nil) {
                    Image(uiImage: (UIImage(named: "camera-icon"))!)

                                        .frame(width: 20, height: 100)
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

            .navigationBarTitle("\(username)'s Profile")
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
