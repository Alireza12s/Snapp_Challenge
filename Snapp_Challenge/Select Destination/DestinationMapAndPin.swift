import Combine
import SwiftUI
import MapKit

struct DestinationMapAndPin : View {
    var link: NavigationDestinationLink<TravelCostPage>
    var publisher: AnyPublisher<Void, Never>

    
    init() {
        let publisher = PassthroughSubject<Void, Never>()
        self.link = NavigationDestinationLink(
            TravelCostPage(onDismiss: { publisher.send() }),
            isDetail: false
        )
        self.publisher = publisher.eraseToAnyPublisher()
    }
    
    var body: some View {
        ZStack{
            
            DestinationMap()
            DestinationPin(isSelected: false)
                .tapAction {
                    self.link.presented?.value = true
                    
            }
            .onReceive(publisher, perform: { _ in
                self.link.presented?.value = false
            })
                .offset(y: 25)
            
        }
    }
}

#if DEBUG
struct DestinationMapAndPin_Previews : PreviewProvider {
    static var previews: some View {
        DestinationMapAndPin()
        .environmentObject(Datas())
    }
}
#endif
