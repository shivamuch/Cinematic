//
//  ListMoviesViewController.swift
//  Cinematic
//
//  Created by Shivam Bajaj on 2023-04-15.
//

import UIKit

class ListMoviesViewController: UIViewController, MoviesViewInteractionLogic {

    private var viewModel = ListMoviesViewModel()

    @IBOutlet private weak var moviesView: MoviesView!
    
    // MARK: - Object lifecycle

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        title = viewModel.viewTitle
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        title = viewModel.viewTitle
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupSarchController()
        fetchMovies()
    }

    // MARK: - Setup

    private func setup() {
        moviesView.viewController = self
    }

    private func setupSarchController() {
        let searchMoviesViewController = SearchMoviesViewController(sender: self)
        searchMoviesViewController.view.layoutIfNeeded()
        let searchController = UISearchController(searchResultsController: searchMoviesViewController)
        searchController.searchResultsUpdater = searchMoviesViewController
        searchController.obscuresBackgroundDuringPresentation = true
        searchController.searchBar.placeholder = "Nome do filme"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }

}


