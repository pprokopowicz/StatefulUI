//
//  StatefulView.swift
//
//
//  Created by Piotr Prokopowicz on 01/09/2021.
//

import SwiftUI

public struct StatefulView<Source: LoadableObject, Content: View, ErrorView: View, IdleView: View, LoadingView: View>: View {
    
    // MARK: - View
    
    private let content: (Source.Output) -> Content
    private let loadingView: () -> LoadingView
    private let errorView: (Error) -> ErrorView
    private let idleView: () -> IdleView
    
    // MARK: - Property
    
    @ObservedObject var source: Source
    
    // MARK: - Init
    
    public init(
        source: Source,
        @ViewBuilder content: @escaping (Source.Output) -> Content,
        @ViewBuilder loadingView: @escaping () -> LoadingView,
        @ViewBuilder errorView: @escaping (Error) -> ErrorView,
        @ViewBuilder idleView: @escaping () -> IdleView
    ) {
        self.source = source
        self.content = content
        self.loadingView = loadingView
        self.errorView = errorView
        self.idleView = idleView
    }
    
    // MARK: - Body
    
    public var body: some View {
        VStack {
            switch source.state {
            case .idle:
                idleView()
            case .loading:
                loadingView()
            case .error(let error):
                errorView(error)
            case .loaded(let value):
                content(value)
            }
        }
    }
    
}
