//
//  CapsuleText.swift
//  Quoteem
//
//  Created by Anton Klimenko on 6/1/23.
//

import SwiftUI

struct CapsuleText: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.system(size: 12))
            .padding(4)
            .foregroundColor(.black)
            .background(.cyan)
            .clipShape(Capsule())
    }
}

