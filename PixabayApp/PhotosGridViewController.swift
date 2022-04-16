//
//  ViewController.swift
//  PixabayApp
//
//  Created by TelloTalk on 07/03/2022.
//

import UIKit
import Combine

protocol PhotosGridViewDelegate: AnyObject {
    func dataDidUpdate()
    func showDataNotAvailable()
}

typealias CellProvider = ((IndexPath) -> UICollectionViewCell)

class PhotosGridViewController: UIViewController, StoryBoarded, PhotosGridViewDelegate {
    
    var viewModel: PhotoGridViewModel!
    
    lazy var collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: GridViewCompositionalLayout.createLayout())
    
    private var cancellables = Set<AnyCancellable>()
    
    var onSearch: ((String) -> ())?
    
    var cellProvider: CellProvider?

    fileprivate func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "cellId")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        viewModel.loadPhotoObjects()
        setupSearchController()
        applyCombineSearch()
    }
    
    func setupSearchController() {
        navigationItem.searchController = searchController
    }
    
    func applyCombineSearch() {
        let publisher = NotificationCenter.default.publisher(for: UISearchTextField.textDidChangeNotification, object: searchController.searchBar.searchTextField)
        publisher
            .map {
                ($0.object as! UISearchTextField).text
            }
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .sink(receiveValue: { [weak self] (value) in
                guard let searchText = value, !searchText.isEmpty else {return}
                self?.onSearch?(searchText)
            })
            .store(in: &cancellables)
    }

    func dataDidUpdate() {
        collectionView.reloadData()
    }
    
    func showDataNotAvailable() {
        print("Data not available")
    }

}

extension PhotosGridViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cellProvider = cellProvider else { return UICollectionViewCell() }
        return cellProvider(indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.itemsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.selectItem(at: indexPath)
    }
    
}
