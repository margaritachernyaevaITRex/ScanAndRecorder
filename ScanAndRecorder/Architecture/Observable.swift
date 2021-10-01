//
//  Observable.swift
//  ScanAndRecorder
//
//  Created by Margarita Chernyaeva on 20.09.21.
//

import Foundation

class Observable<Type> {
    
    // MARK: - Public Data
    public typealias Observer = (Type) -> ()
    public var value: Type {
        didSet {
            self.notify(didChanged: value)
        }
    }
    
    // MARK: - Private Data
    private var observers: [Observer?] = []
    
    // MARK: - Initialization
    public init(_ value: Type) {
        self.value = value
    }
    
    // MARK: - Public Methods
    func cleanBinds() {
        self.observers.removeAll()
    }
    
    func bind(_ observer: @escaping Observer) {
        self.observers.append(observer)
    }
    
    // MARK: - Private Methods
    private func notify(didChanged newValue: Type) {
        for observer in observers {
            observer?(newValue)
        }
    }

}
