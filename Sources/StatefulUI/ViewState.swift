//
//  ViewState.swift
//  
//
//  Created by Piotr Prokopowicz on 01/09/2021.
//

import Foundation

public enum ViewState<Value> {
    case idle
    case loading
    case noContent
    case loaded(Value)
}
