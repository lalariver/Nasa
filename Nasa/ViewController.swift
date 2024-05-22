//
//  ViewController.swift
//  Nasa
//
//  Created by user on 2024/5/9.
//

import UIKit

class ViewController: UIViewController {
    
    let viewModel = FetchDataViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
        
        viewModel.fetchData()
    }
    
    private func setupButton() {
        let button = UIButton(type: .system)
        button.setTitle("Next page", for: .normal)
        button.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        button.center = view.center
        view.addSubview(button)
    }
    
    @objc private func nextPage() {
        let VC = CollectionViewController(viewModel: viewModel)
        let navController = UINavigationController(rootViewController: VC)
        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true)
    }
}

