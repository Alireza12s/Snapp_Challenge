//
//  Origin.swift
//  Snapp_Challenge
//
//  Created by ali on 7/21/19.
//  Copyright © 2019 ali. All rights reserved.
//

import SwiftUI

struct Origin: View {
    
    var body: some View {
        NavigationView{
            ZStack{
                OriginMap_Pin()
                BottomBar()
            }.navigationBarItems(trailing: TopBar())
            }
    }
}

#if DEBUG
struct Origin_Previews: PreviewProvider {
    static var previews: some View {
        Origin()
            .environmentObject(Datas())
    }
}
#endif
