//
//  WeatherForecastViewModel.swift
//  RainingOrNot
//
//  Created by Antonio Di Giacomo on 15/01/2023.
//

import Foundation
import Combine

final class WeatherForecastViewModel {
    let input = Input()
    let ouput: Output
    let repo: ForecastRepo
    
    init(repo: ForecastRepo) {
        self.repo = repo
        let forecast: Forecast = .default
        self.ouput = .init(
            data: Just(forecast).eraseToAnyPublisher(),
            showLocations: Just(()).eraseToAnyPublisher()
        )
    }
}

extension WeatherForecastViewModel {
    struct Input {
        let locationsTapped: PassthroughSubject<Void, Never> = .init()
        let reload: PassthroughSubject<Void, Never> = .init()
        let ready: PassthroughSubject<Void, Never> = .init()
    }
    
    struct Output {
        let data: AnyPublisher<Forecast, Never>
        let showLocations: AnyPublisher<Void, Never>
    }
}
