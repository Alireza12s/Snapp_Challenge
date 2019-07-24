
import SwiftUI

struct DarkhastSnappBar : View {
    @EnvironmentObject var data: Datas
    
    var body: some View {
        
            ZStack{
                Rectangle()
                    .foregroundColor(.init(hue: 220.0, saturation: 59, brightness: 0))
                .frame(width: UIScreen.main.bounds.width, height: 100)
                
                GreenButton()
            }.frame(height: 100)
            
        
        
    }
    
}

#if DEBUG
struct DarkhastSnappBar_Previews : PreviewProvider {
    static var previews: some View {
        DarkhastSnappBar()
            .environmentObject(Datas())
    }
}
#endif
