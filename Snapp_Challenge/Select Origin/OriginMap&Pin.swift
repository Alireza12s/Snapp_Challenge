import SwiftUI
import Combine
import MapKit

struct OriginMap_Pin: View {
    var link: NavigationDestinationLink<Destination>
    var publisher: AnyPublisher<Void, Never>
    
    init() {
        let publisher = PassthroughSubject<Void, Never>()
        self.link = NavigationDestinationLink(
            Destination(onDismiss: { publisher.send() }),
            isDetail: false
        )
        self.publisher = publisher.eraseToAnyPublisher()
    }
    
    var body: some View {
        ZStack{
            OriginMap()
                .frame(height: UIScreen.main.bounds.height-100)
                .edgesIgnoringSafeArea(.bottom)
            
            
            OriginPin()
                .tapAction {
                    self.link.presented?.value = true
            }
            .onReceive(publisher, perform: { _ in
                self.link.presented?.value = false
            })
            .offset( y: 25)
            
        }
    }
}

#if DEBUG
struct OriginMap_Pin_Previews: PreviewProvider {
    static var previews: some View {
        OriginMap_Pin()
    }
}
#endif
