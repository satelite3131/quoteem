//
//  MainScreenView.swift
//  Quoteem
//
//  Created by Anton Klimenko on 5/31/23.
//

import SwiftUI

struct MainScreenView: View, ViewProtocol {
    var presenter: MainScreenViewToPresenterProtocol!
    @ObservedObject var viewModel: MainScreenViewModel
    
    init(presenter: MainScreenViewToPresenterProtocol, viewModel: MainScreenViewModel) {
        self.presenter = presenter
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack (alignment: .center, spacing: 24) {
            Spacer()

            if !viewModel.isLoading && viewModel.quote != nil {
                    VStack {
                        CapsuleText(text: viewModel.quote?.tag ?? "")
                            .frame(height: 60)
                        Text("'\(viewModel.quote?.text ?? "")'")
                            .font(.system(size: 30, weight: .light))
                            .foregroundColor(.white)
                            .padding(.bottom, 40)
                        Text(viewModel.quote?.author ?? "")
                            .font(.system(size: 16))
                    }
            } else {
                Text("Thinking...")
                    .font(.system(size: 30, weight: .light))
                    .foregroundColor(.white)
                    .transition(.opacity)
            }
            Spacer()
            Button {
                withAnimation {
                    presenter.getNewQuote()
                }
            } label: {
                Text("Get more wisdom")
                    .scaleEffect(!viewModel.isLoading ? 1.08 : 1.0)
                    .opacity(!viewModel.isLoading ? 0.8 : 1.0)
                    .foregroundColor(.cyan.opacity(0.7))
                    .animation(Animation.easeInOut(duration: 3.0).repeatForever(autoreverses: true), value: viewModel.isLoading)
            }
            .padding(.bottom, 16)
        }
        .padding(.vertical, 32)
        .padding(.horizontal, 16)
    }
}

