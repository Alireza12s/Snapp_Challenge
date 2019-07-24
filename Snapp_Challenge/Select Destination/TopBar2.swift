import Combine
import SwiftUI

struct TopBar2 : View {
    @EnvironmentObject var data: Datas
    @Binding var onDismiss: () -> Void
    

    var body: some View {
        VStack {
            
            HStack{
                Button(action: self.onDismiss) {
                    Image("BackButton3")
                        .renderingMode(.original)
                        .frame(width: 40, height: 40)
                        .offset(y: 3)
                }.offset(x: -15)
                Spacer()
                
                Button(action: {
                    
                }){
                    Image("Search")
                        .renderingMode(.original)
                        .frame(width: 40, height: 40)
                }.disabled(true)
                
                Spacer()
                Text(verbatim: "کجا می روید؟")
                    .bold()
                Spacer(minLength: 85)
                
                Button(action: {}) {
                    Image("MenueButtonIcon")
                        .renderingMode(.original)
                        .frame(width: 40, height: 40)
                }
                
            }
            .padding()
            .foregroundColor(.gray)
            
            
        }
    }
}

#if DEBUG
struct TopBar2_Previews : PreviewProvider {
    static var previews: some View {
        
        Group {
            TopBar2(onDismiss: .constant {})
                .environmentObject(Datas())
                .environment(\.colorScheme, .dark)

            
            TopBar2(onDismiss: .constant {})
                .environmentObject(Datas())
                .environment(\.colorScheme, .light)
        }
    }
}
#endif
