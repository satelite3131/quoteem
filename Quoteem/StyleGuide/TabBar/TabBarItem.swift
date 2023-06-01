//
//  TabBarItem.swift
//  Quoteem
//
//  Created by Anton Klimenko on 5/31/23.
//

import SwiftUI

struct TabBarItem: View {
    @State var imageName: String
    @State var state: TabBarState
    var isCentral: Bool = false
    @State var onPress: () -> Void

    var color: Color {
        switch state {
        case .active:
            return Color.gray
        case .inactive:
            return Color.gray
        case .selected:
            return Color.black
        }
    }

    var body: some View {
        Image(imageName)
            .resizable()
            .foregroundColor(color)
            .aspectRatio(1, contentMode: .fit)
            .frame(height: isCentral ? 48 : 32)
            .frame(maxWidth: .infinity)
            .onTapGesture(perform: onPress)
    }
}
