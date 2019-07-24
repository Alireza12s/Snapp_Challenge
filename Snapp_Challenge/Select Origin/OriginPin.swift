import MapKit
import SwiftUI

struct OriginPin : View {
    

    
    @State var isSelected = false
    
    var body: some View {

            VStack{
                if Datas.originIsSelected {
                    Image("origin",bundle: nil)
                        .renderingMode(.original)
                        .offset(y: 10)
                    
                    
                    ZStack{
                        Circle()
                            .foregroundColor(.gray)
                            .frame(width: 30, height: 30)
                        
                        Circle()
                            .foregroundColor(.white)
                            .frame(width: 8, height: 8)
                        
                        
                        Circle()
                            .frame(width: 4, height: 4)
                    }
                } else {
                    
                    Circle()
                        .foregroundColor(.gray)
                        .frame(width: 20, height: 20)
                    Image("origin")
                        .renderingMode(.original)
                        .offset(y: -97)
                }
            }
        }
    }
    


#if DEBUG
struct OriginPin_Previews : PreviewProvider {
    static var previews: some View {
        OriginPin()
    }
}
#endif
