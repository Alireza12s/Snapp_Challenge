//
//  BottomBar.swift
//  Snapp_Challenge
//
//  Created by ali on 7/2/19.
//  Copyright © 2019 ali. All rights reserved.
//

import SwiftUI

struct BottomBar2 : View {
    var body: some View {
        
        
        
        
        VStack {

            Spacer()
            ZStack{
                Rectangle().frame(width: 350, height: 100, alignment: .bottom)
                    .foregroundColor(.gray)
                    .cornerRadius(25)
                    .shadow(radius: 5)
                    VStack{
                        
                        
                        Text(verbatim: "مبدا:")
                        Image("Line")
                        Text(verbatim: "مقصد:")
                    }
                    .frame(width: 350, height: 100, alignment: .bottom)
                    .offset( y: -10)
                    }.frame(height: UIScreen.main.bounds.height/6)
            
                }.padding()
            .offset(y: -50)
            
            
        
    }
}

#if DEBUG
struct BottomBar2_Previews : PreviewProvider {
    static var previews: some View {
        BottomBar2()
        .environmentObject(Datas())
    }
}
#endif
