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
    @State private var username: String = ""
    @State private var income: String = "$"
//    @State private var age: Int
//    @State private var profession: String
//    @State private var gender: String
    @EnvironmentObject var users: Users
    
    
    
    
    var body: some View {
        NavigationView{
            VStack{
                Spacer().frame(height: 70)// Spacing from navigation bar title
                ZStack{
                    Rectangle()
                        .fill(Color.secondary)
                        .frame(width: 70, height: 50)
                    
                    if (image == nil) {
                        Image(uiImage: (UIImage(named: "camera-icon"))!)

                            .frame(width: 20, height: 10)


                    } else {
                        image?
                            .resizable()
                            
                            .frame(width: 150, height: 150)
//                            .border(Color.black, width: 3)
                            .clipped()
                            .clipShape(Circle())
                            .overlay(
                                Circle().stroke(Color.white, lineWidth:4))
                            .shadow(radius: 10)
                            .scaledToFit()
                    }
                
                }
                .onTapGesture {
                    self.showImagePicker = true
                }
                
                Button("choose picture"){
                    self.showSheet = true
                    
                }.foregroundColor(.white)
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
                
                Spacer().frame(height: 30)
                
                Text("Name")
                    .font(.callout)
                    .bold().foregroundColor(.white)
                
                TextField("Enter your name", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle()).frame(width: 300, height: 50)
                Spacer().frame(height: 30)
                
                Text("Income")
                    .font(.callout)
                    .bold().foregroundColor(.white)
                
                TextField("Enter your income", text: $income)
                    .textFieldStyle(RoundedBorderTextFieldStyle()).frame(width: 300, height: 50)
                
                 
                Button(action: {
       
                    users.addUser(name: self.username, income: self.income, image: self.inputImage!)
                    
                    
                }) {
                    HStack {
                        Spacer()
                        Text("Save").bold()
                            .frame(minWidth: 0, maxWidth: 130, maxHeight: 10)
                            .padding()
                            .foregroundColor(.black)
                            .background(Color.white)
                            .cornerRadius(20)
                            .font(.body)
                        Spacer()
                    }
                }
                    .padding(.top, 40).navigationBarTitle("\(username)'s Profile").font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
            }.sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                ImagePicker(image: self.$inputImage)
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity).background(LinearGradient(gradient: Gradient(colors: [.blue, Color("custGreen")]), startPoint: .top, endPoint: .bottom)).edgesIgnoringSafeArea(.all)
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
    

}

