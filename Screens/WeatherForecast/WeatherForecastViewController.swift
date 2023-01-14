//
//  WeatherForecastViewController.swift
//  RainingOrNot
//
//  Created by Antonio Di Giacomo on 15/01/2023.
//

import UIKit

final class WeatherForecastViewController: UIViewController {
    private let vm: WeatherForecastViewModel
    
    init(vm: WeatherForecastViewModel) {
        self.vm = vm
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = AddLocationView()
    }
}
