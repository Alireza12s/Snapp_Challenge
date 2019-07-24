import SwiftUI

struct FavouriteItem : View {
    @EnvironmentObject var data: Datas
    @State var text: String
    
    
    var body: some View {
        
        HStack {
            Text(verbatim: text)
                .bold()
            .foregroundColor(.black)
            Image("StarIcon")
                .renderingMode(.original)
                .frame(width: 30, height: 30)
                .offset(x: -20)
            
        }.padding()
            .frame(height: 30)
        
    }
}

#if DEBUG
struct FavouriteItem_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            FavouriteItem(text: Datas.favourites[0]["name"] as! String)
                .environmentObject(Datas())
                .environment(\.colorScheme, .dark)
            
            FavouriteItem(text: Datas.favourites[0]["name"] as! String)
                .environmentObject(Datas())
                .environment(\.colorScheme, .light)
            
        }
        
    }
}
#endif
