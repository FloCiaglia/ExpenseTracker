import SwiftUI

struct AddCategory: View {
    @Binding var isPresented: Bool
    @EnvironmentObject var categories: Categories
    
    @State private var category: String = ""
    
    var body: some View {
        VStack {
            Section(header: Text("New Category").bold().foregroundColor(Color("custGreen")))
            {
                TextField("Enter new category", text: $category).textFieldStyle(RoundedBorderTextFieldStyle())
            }
            Button(action: {
                if (self.category != "") {
                    print(self.category)
                    categories.addCategory(category: self.category)
                }
                    close()
                
            }) {
                Text(self.category == "" ? "Cancel" : "Add Category").font(.title).fontWeight(.heavy).foregroundColor(.white).bold()
            }.frame(width: 320, height: 60).background(Color("custGreen"))
        }
        
    }
    
    func close() {
        self.isPresented = false
    
    }}


//struct AddCategory_Previews: PreviewProvider {
//    static var previews: some View {
//        AddCategory(isPresented: <#Binding<Bool>#>)
//    }
//}
