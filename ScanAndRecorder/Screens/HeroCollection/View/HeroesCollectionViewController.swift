//
//  HeroesListViewController.swift
//  ScanAndRecorder
//
//  Created by Margarita Chernyaeva on 20.09.21.
//

import UIKit

class HeroesCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: - @IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Private Data
    private var viewModel = HeroCollectionViewModel()
    private let amountOfImagesOnLine: CGFloat = 2
    private let distanceBetweenImages: CGFloat = 15
    private let sizeDifference: CGFloat = 1.6
    
    // MARK: - View Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        bind()
        viewModel.fetchHeroes()
    }

    // MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.heroes.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeroImageCollectionViewCell", for: indexPath) as? HeroImageCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: viewModel.heroes.value[indexPath.item].thumbnail?.url, name: viewModel.heroes.value[indexPath.item].name)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = UIScreen.main.bounds.width / amountOfImagesOnLine - distanceBetweenImages
        let height: CGFloat = width * sizeDifference
        return CGSize(width: width, height: height)
    }
    
    // MARK: - Private Methods
    private func configure() {
        collectionView.register(HeroImageCollectionViewCell.nib(), forCellWithReuseIdentifier: viewModel.cellIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func bind() {
        viewModel.heroes.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
}
