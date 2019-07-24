
import SwiftUI

struct TopBar3: View {
    @Binding var onDismiss: () -> Void
    var body: some View {
                        HStack{
            Button(action: self.onDismiss)
            {
                Image("BackButton2")
                    .renderingMode(.original)
                
            }
            Spacer()
            Text(verbatim: "سفر به سلامت")
                .bold()
            Spacer()
            Button(action: {
                
            }){
                Image("MenueButtonIcon")
                    .renderingMode(.original)
            }.frame(width: 10, height: 10)
        }.padding()
            .frame(width: UIScreen.main.bounds.width, height: 40)
    }
}

#if DEBUG
struct TopBar3_Previews: PreviewProvider {
    static var previews: some View {
        TopBar3(onDismiss: .constant {})
    }
}
#endif
