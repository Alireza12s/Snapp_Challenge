////
////  DarkhastSnappBar.swift
////  Snapp_Challenge
////
////  Created by ali on 7/3/19.
////  Copyright © 2019 ali. All rights reserved.
////
//
//import SwiftUI
//
//struct DarkhastSnappBar : View {
//    @EnvironmentObject var data: Datas
//
//    var body: some View {
//
//        VStack {
//            Spacer()
//            HStack{
//                VStack{
//                    Rectangle()
//                        .frame(width: UIScreen.main.bounds.width/4, height: 85)
//                        .foregroundColor(.init(hue: 220.0, saturation: 59, brightness: 0))
//                        .edgesIgnoringSafeArea(.all)
//                        .offset(x: 8.5)
//
//
//
//                }
//
//
//                Button(action: {}) {
//                    VStack{
//                        GreenButton()
//                            .offset(y: 6)
//
//
//                        Rectangle()
//
//                            .frame(width: UIScreen.main.bounds.width/2, height: 50)
//                            .foregroundColor(.green)
//                            .edgesIgnoringSafeArea(.all)
//                            .offset(y: -10)
//
//                    }.offset(y: 2)
//                }
//
//
//                VStack{
//                    Rectangle().frame(width: UIScreen.main.bounds.width/4, height: 85)
//                        .foregroundColor(.init(hue: 220.0, saturation: 59, brightness: 0))
//                        .edgesIgnoringSafeArea(.all)
//                        .offset(x: -8.5)
//
//
//                }
//            }
//        }.edgesIgnoringSafeArea(<#T##edges: Edge.Set##Edge.Set#>)
//    }
//
//}
//
//#if DEBUG
//struct DarkhastSnappBar_Previews : PreviewProvider {
//    static var previews: some View {
//        DarkhastSnappBar()
//            .environmentObject(Datas())
//    }
//}
//#endif
//
//
////
////  DarkhastSnappBar.swift
////  Snapp_Challenge
////
////  Created by ali on 7/3/19.
////  Copyright © 2019 ali. All rights reserved.
////

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
