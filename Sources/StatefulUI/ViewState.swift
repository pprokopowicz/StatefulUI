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
