//
//  HeroViewModel.swift
//  ScanAndRecorder
//
//  Created by Margarita Chernyaeva on 20.09.21.
//

import Foundation

protocol HeroCollectionViewModelProtocol: AnyObject {
    func fetchHeroes()
    var heroes: Observable<[Hero]> { get set }
    var error: Observable<Bool>  { get set }
}

// MARK: - ViewModel
class HeroCollectionViewModel: HeroCollectionViewModelProtocol {
    
    // MARK: - Public Data
    var heroes: Observable<[Hero]> = Observable([])
    var error: Observable<Bool> = Observable(false)
    let cellIdentifier = "HeroImageCollectionViewCell"
    
    // MARK: - Public Methods
    func fetchHeroes() {
        NetworkManager.getHeroes { [weak self] result in
            switch result {
            case .success(let heroes):
                self?.heroes.value = heroes
            case .failure(let error):
                NSLog(error.localizedDescription)
            }
        }
    }
    
}
