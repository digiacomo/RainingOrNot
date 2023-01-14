//
//  LocationListViewModel.swift
//  RainingOrNot
//
//  Created by Antonio Di Giacomo on 15/01/2023.
//

import Combine

final class LocationListViewModel {
    let input: Input = .init()
    let output: Output
    
    private let persistance: AnyPersistable<Location>
    
    init(persistance: AnyPersistable<Location>) {
        self.persistance = persistance
        
        let list = input.ready
            .asyncMap { _ in
                await persistance.findAll()
            }
        
        self.output = .init(
            list: list.eraseToAnyPublisher(),
            navigateToForecast: Just(.default).eraseToAnyPublisher(),
            navigateToAddLocation: input.addLocation.eraseToAnyPublisher()
        )
    }
}

extension LocationListViewModel {
    struct Input {
        let addLocation: PassthroughSubject<Void, Never> = .init()
        let removeLocation: PassthroughSubject<Int, Never> = .init()
        let showForecastTapped: PassthroughSubject<Location, Never> = .init()
        let ready: PassthroughSubject<Void, Never> = .init()
    }
    
    struct Output {
        let list: AnyPublisher<[Location], Never>
        let navigateToForecast: AnyPublisher<Location, Never>
        let navigateToAddLocation: AnyPublisher<Void, Never>
    }
}
