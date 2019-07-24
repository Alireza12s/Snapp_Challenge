import SwiftUI

struct TravelCostPage : View {
    @EnvironmentObject var data: Datas
    var onDismiss: () -> Void
    
    
    var body: some View {
        VStack{
            MapView()
            CostBottom()
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarItems(leading: TopBar3(onDismiss: .constant(self.onDismiss)))
    }
}



#if DEBUG
struct TravelCostPage_Previews : PreviewProvider {
    static var previews: some View {
        TravelCostPage(onDismiss: {})
            .environmentObject(Datas())
    }
}
#endif


