//
//  GrrenButton.swift
//  Snapp_Challenge
//
//  Created by ali on 7/4/19.
//  Copyright © 2019 ali. All rights reserved.
//

import SwiftUI

struct GreenButton : View {
    
    @EnvironmentObject var data: Datas

    
    var body: some View {
        Button(action: {}) {
                ZStack{
                    
                    Rectangle()
                        .foregroundColor(.green)
                        .frame(width: UIScreen.main.bounds.width/2,height: 100)
                        
                        VStack {
                            Text(verbatim: data.travelType)
                                .bold()
                                .foregroundColor(.white)
                                .offset(y: -30)
                            
                        }


                            
                        }
                        
                    }
    }

}
#if DEBUG
struct GreenButton_Previews : PreviewProvider {
    static var previews: some View {
        GreenButton().environmentObject(Datas())
        .environment(\.colorScheme, .dark)

    }
}
#endif
