//
//  BottomBar.swift
//  Snapp_Challenge
//
//  Created by ali on 7/2/19.
//  Copyright © 2019 ali. All rights reserved.
//

import SwiftUI

struct BottomBar : View {
    var body: some View {
        
        
        
        VStack{
            Spacer()
            
            VStack {
                CurrentLocation()
                    .offset(x: UIScreen.main.bounds.width*5/12)
            
            
            
            ZStack{
                Rectangle().frame(width: 350, height: 100, alignment: .bottom)
                    .foregroundColor(.gray)
                    .cornerRadius(25)
                    .shadow(radius: 5)
                VStack{
                    
                    
                    HStack {
                        Text(verbatim: "اسنپ موجود").foregroundColor(.black)
                        Text(verbatim: "۴").foregroundColor(.black)
                    }
                    Image("Line")
                    Text(verbatim: "مبدا:").foregroundColor(.black)
                    }
                    .frame(width: 350, height: 100, alignment: .bottom)
                    .offset( y: -10)
                }
            }.offset( y: -30)
            }
    }
}

#if DEBUG
struct BottomBar_Previews : PreviewProvider {
    static var previews: some View {
        
            BottomBar()
                .environmentObject(Datas())
            

    }
}
#endif
