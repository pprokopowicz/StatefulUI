//
//  ErrorHandler.swift
//  
//
//  Created by Piotr Prokopowicz on 25/09/2021.
//

import SwiftUI
import Combine

public struct ErrorHandler: ViewModifier {
    
    enum InitialError: Error {
        case general
    }
    
    // MARK: - Properties
    
    @State private var isPresented = false
    @State private var error: Error
    private let errorPublisher: AnyPublisher<Error, Never>
    private let alertBuilder: (Error) -> Alert
    
    public init(_ errorPublisher: AnyPublisher<Error, Never>, alertBuilder: @escaping (Error) -> Alert) {
        self.errorPublisher = errorPublisher
        self.alertBuilder = alertBuilder
        self.error = InitialError.general
    }
    
    // MARK: - ViewModifier
    
    public func body(content: Content) -> some View {
        content
            .alert(isPresented: $isPresented, content: {
                alertBuilder(error)
            })
            .onReceive(errorPublisher) { error in
                self.error = error
                isPresented = true
            }
    }
}

public extension View {
    func handleError(_ publisher: AnyPublisher<Error, Never>, alertBuilder: @escaping (Error) -> Alert) -> some View {
        self.modifier(ErrorHandler(publisher, alertBuilder: alertBuilder))
    }
}
