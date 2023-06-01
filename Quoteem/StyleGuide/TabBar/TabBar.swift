//
//  TabBar.swift
//  Quoteem
//
//  Created by Anton Klimenko on 5/31/23.
//

import SwiftUI

struct TabBar: ViewModifier {
    var currentTab: LocalRootKind
    var onTabPressed: (LocalRootKind, Bool) -> Void

    init(currentTab: LocalRootKind, onTabPressed: @escaping (LocalRootKind, Bool) -> Void) {
        self.currentTab = currentTab
        self.onTabPressed = onTabPressed
    }

    func body(content: Content) -> some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                content
                Spacer(minLength: 0)

                if !isKeyboardShown(screenHeight: geometry.size.height) {
                    Divider()
                    HStack {
                        TabBarItem(
                            imageName: "TaskIcon",
                            state: getState(for: .mainScreen),
                            onPress: setOnPressAction(for: .mainScreen)
                        )
                    }
                        .padding(.horizontal)
                        .frame(width: geometry.size.width, height: 58)
                        .background(Color.white)
                }
                Rectangle()
                    .frame(width: geometry.size.width, height: geometry.safeAreaInsets.bottom)
                    .foregroundColor(.white)
            }
                .frame(maxHeight: .infinity, alignment: .bottom)
                .edgesIgnoringSafeArea(.bottom)
        }
    }

    private func getState(for tabKind: LocalRootKind) -> TabBarState {

        if tabKind == currentTab {
            return .selected
        }

        return .active
    }

    private func setOnPressAction(for tabKind: LocalRootKind) -> (() -> Void) {
        let shouldReloadTab = tabKind == currentTab
        return { onTabPressed(tabKind, shouldReloadTab) }
    }
    func isKeyboardShown(screenHeight: CGFloat) -> Bool {
        return screenHeight < 500
    }
}

