//
//  LoadableObject.swift
//  
//
//  Created by Piotr Prokopowicz on 01/09/2021.
//

import Foundation

public protocol LoadableObject: ObservableObject {
    
    associatedtype Output
    
    var state: ViewState<Output> { get }
    
}
