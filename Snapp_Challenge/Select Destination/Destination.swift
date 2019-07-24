import UIKit
import SwiftUI




struct Destination: View {
    @EnvironmentObject var data: Datas
     var onDismiss: () -> Void
    
    
    
    
    
    var body: some View {
        ZStack{
                VStack{
                    
                    FavouritesBar()
                    Divider()
                    DestinationMapAndPin()

            }
                    BottomBar2()
                        .offset(y: 20)
        }
                    .edgesIgnoringSafeArea(.bottom)
                  

        .navigationBarItems(leading: TopBar2(onDismiss: .constant(self.onDismiss))
)

    }
}





#if DEBUG
struct Destination_Previews: PreviewProvider {
    static var previews: some View {
        Destination(onDismiss: {})
            .environmentObject(Datas())
    }
}
#endif
