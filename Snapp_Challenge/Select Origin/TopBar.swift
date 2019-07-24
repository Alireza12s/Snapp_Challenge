import Combine
import SwiftUI


struct TopBar : View {
    @EnvironmentObject var data: Datas
    
    
    var body: some View {
        
        HStack {
            
            Button(action: {
            }){
                Image("Search")
                    .renderingMode(.original)
                    .frame(width: 40 , height: 40)
            } 
            Spacer()
            Text(verbatim: "کجا هستید؟")
                .bold()
                .font(.custom("iransans", size: 20))
            
            
            
            Spacer()
            Button(action: {}) {
                Image("MenueButtonIcon")
                    .renderingMode(.original)
                    .frame(width: 40, height: 40)
                
            }
            
        }.padding()
            .foregroundColor(.gray)
            
            
            .frame(width: UIScreen.main.bounds.width, height: 50)
        
    }
}

#if DEBUG
struct TopBar_Previews : PreviewProvider {
    static var previews: some View {
        Group{
            TopBar()
                .environmentObject(Datas())
                .environment(\.colorScheme, .light)

            TopBar()
                .environmentObject(Datas())
                .environment(\.colorScheme, .dark)
        }
    }
}
#endif
