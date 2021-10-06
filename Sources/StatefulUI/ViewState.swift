//
//  ViewState.swift
//  
//
//  Created by Piotr Prokopowicz on 01/09/2021.
//

import Foundation

public enum ViewState<Value> {
    case idle
    case loading(LoadingMode<Value>)
    case noContent
    case loaded(Value)
    
    public enum LoadingMode<Value> {
        case cover
        case cross(Value)
    }
}

extension ViewState.LoadingMode: Equatable where Value: Equatable {
    
    public static func == (lhs: ViewState.LoadingMode<Value>, rhs: ViewState.LoadingMode<Value>) -> Bool {
        switch (lhs, rhs) {
        case (.cover, .cover):
            return true
        case (.cross(let lhsValue), .cross(let rhsValue)):
            return lhsValue == rhsValue
        default:
            return false
        }
    }
    
}

extension ViewState: Equatable where Value: Equatable {
    
    public static func == (lhs: ViewState<Value>, rhs: ViewState<Value>) -> Bool {
        switch (lhs, rhs) {
        case (.idle, .idle):
            return true
        case (.loading(let lhsValue), .loading(let rhsValue)):
            return lhsValue == rhsValue
        case (.noContent, .noContent):
            return true
        case (.loaded(let lhsMode), .loaded(let rhsMode)):
            return lhsMode == rhsMode
        default:
            return false
        }
    }
    
}
