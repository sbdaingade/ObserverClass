//
//  Observer.swift
//  ObserableDemo
//
//  Created by Sachin Daingade on 01/12/21.
//

import Foundation

public class Observer<T> {
    
    var value:T? {
        didSet {
            observerBlock?(value)
        }
    }
    private var observerBlock: ((T?) -> Void)?
    
    init(value: T?) {
        self.value = value
    }
    
    public func add(_ observer:@escaping(T?) -> Void) {
        self.observerBlock = observer
    }
    
    deinit {
        
    }
}
