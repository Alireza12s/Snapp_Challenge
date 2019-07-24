import SwiftUI

struct CurrentLocation : View {
    
    
    var body: some View {
        Button(action: {
            
        }) {
            ZStack{
                Circle()
                    .foregroundColor(.white)
                    .shadow(radius: 10)
                    .frame(width: Length(integerLiteral: 25), height: Length(integerLiteral: 25))
                    Image("Image")
                        .renderingMode(.original).offset(x: -2, y: 2)
                
                    }
                }
        
    }
}

#if DEBUG
struct CurrentLocationn_Previews : PreviewProvider {
    static var previews: some View {
        CurrentLocation()
    }
}
#endif
