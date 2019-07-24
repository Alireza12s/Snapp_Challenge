//
//  DestinationPin.swift
//  Snapp_Challenge
//
//  Created by ali on 7/5/19.
//  Copyright © 2019 ali. All rights reserved.
//

import SwiftUI

struct DestinationPin : View {
    
    @State var isSelected = false
    
    var body: some View {
        VStack{
            if self.isSelected {
                Image("destination")
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
            } else{
                
                Circle()
                    .foregroundColor(.gray)
                    .frame(width: 20, height: 20)
                Image("destination")
                    .renderingMode(.original)
                    .offset(y: -100)
            }
        }
    }
}

#if DEBUG
struct DestinationPin_Previews : PreviewProvider {
    static var previews: some View {
        DestinationPin(isSelected: false)
        .environmentObject(Datas())

    }
}
#endif
