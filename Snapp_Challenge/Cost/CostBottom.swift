//
//  BottomBar.swift
//  Snapp_Challenge
//
//  Created by ali on 7/3/19.
//  Copyright © 2019 ali. All rights reserved.
//

import SwiftUI

struct CostBottom : View {
    @EnvironmentObject var data: Datas

    var body: some View {
        

            ZStack{
                
                VStack {
                    Spacer()
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/3)
                }
                
                VStack{
                    Spacer()
                    SelectKindBar(color1: Color.black, color2: Color.gray, color3: Color.gray, color4: Color.gray)
                    .frame( height: 140)
                    Takhfif_OptionsBar()
                    DarkhastSnappBar()
                    
                    
                }
                }
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*1.5/4)
                    
    }
}

#if DEBUG
struct CostBottom_Previews : PreviewProvider {
    static var previews: some View {
        CostBottom()
        .environmentObject(Datas())
    }
}
#endif
