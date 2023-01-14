//
//  LocationListViewController.swift
//  RainingOrNot
//
//  Created by Antonio Di Giacomo on 15/01/2023.
//

import UIKit
import Combine

final class LocationListViewController: UIViewController {
    var cancellables = Set<AnyCancellable>()
    
    private let vm: LocationListViewModel
    
    init(vm: LocationListViewModel) {
        self.vm = vm
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
