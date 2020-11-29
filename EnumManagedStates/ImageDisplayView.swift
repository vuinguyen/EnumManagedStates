//
//  ImageDisplayView.swift
//  EnumManagedStates
//
//  Created by Vui Nguyen on 11/29/20.
//

import SwiftUI

struct ImageDisplayView: View {
    //@State var display = true
    @EnvironmentObject var settings : EnvironmentSettings


    var body: some View {
        VStack {
            if settings.imageName != settings.noImage  {
                Image("\(self.settings.imageName)")
                   .resizable()
                   .frame(width: 150, height: 120)
            }
        }
        .fixedSize()
        .frame(width: 150, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }


}

struct ImageDisplayView_Previews: PreviewProvider {
    static var previews: some View {
        ImageDisplayView().environmentObject(EnvironmentSettings())
    }
}
