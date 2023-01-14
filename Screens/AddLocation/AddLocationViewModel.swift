//
//  AddLocationViewModel.swift
//  RainingOrNot
//
//  Created by Antonio Di Giacomo on 15/01/2023.
//

import Foundation
import Combine

final class AddLocationViewModel {
    
}

extension AddLocationViewModel {
    struct Input {
        let locationInput: AnyPublisher<String, Error>
        let selectLocation: AnyPublisher<Int, Error>
    }
    
    struct Output {
        let locationSuggestions: AnyPublisher<[String], Error>
        let selectedLocation: AnyPublisher<Location, Error>
    }
}
