//
//  MainCoordinator.swift
//  RainingOrNot
//
//  Created by Antonio Di Giacomo on 15/01/2023.
//

import UIKit

struct MainCoordinator: Coordinator {
    private weak var navController: UINavigationController?
    
    init(navController: UINavigationController) {
        self.navController = navController
    }
    
    func start() {
        let vm = makeLocationListViewModel()
        let vc = LocationListViewController(vm: vm)
        
        vm.output.navigateToForecast
            .sink(receiveValue: showForecast)
            .store(in: &vc.cancellables)
        
        vm.output.navigateToAddLocation
            .sink(receiveValue: showAddLocation)
            .store(in: &vc.cancellables)
        
        navController?.show(vc, sender: nil)
    }
    
    private func makeLocationListViewModel() -> LocationListViewModel {
        let repo = UserDefaultPersistence<Location>(userDefaults: UserDefaults())
        let vm = LocationListViewModel(persistance: repo.eraseToAnyPersistable)
        return vm
    }
    
    private func makeWeatherForecastViewModel() -> WeatherForecastViewModel {
        guard let baseUrl = URL(string: "https://api.openweathermap.org/data/3.0") else {
            fatalError()
        }
        let persistence = UserDefaultPersistence<Forecast>(userDefaults: .init()).eraseToAnyPersistable
        let httpClient = NetworkClient(urlSession: .shared)
        let apiClient = APIClient(client: httpClient, baseURL: baseUrl)
        let repo = ForecastRepo(persistence: persistence, apiClient: apiClient)
        let vm = WeatherForecastViewModel(repo: repo)
        return vm
    }
    
    private func showForecast(for location: Location) {
        let vm = makeWeatherForecastViewModel()
        let vc = WeatherForecastViewController(vm: vm)
        
        navController?.show(vc, sender: nil)
    }
    
    private func showAddLocation() {
        let vm = AddLocationViewModel()
        let vc = AddLocationViewController(vm: vm)
        navController?.present(vc, animated: true)
    }
}
