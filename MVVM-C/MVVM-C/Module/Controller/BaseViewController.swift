//
//  BaseViewController.swift
//  MVVM-C
//
//  Created by Durgesh Lal Gupta on 3/17/19.
//  Copyright © 2019 Durgesh Lal Gupta. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    private lazy var spinner: UIActivityIndicatorView = {
        let tempSpinner = UIActivityIndicatorView()
        tempSpinner.hidesWhenStopped = true
        tempSpinner.style = .gray
        tempSpinner.color = .green
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        appDelegate?.window?.addSubview(tempSpinner)
        
        let views: [String: Any] = ["tempSpinner": tempSpinner]
        var constraints: [NSLayoutConstraint] = []
        constraints += NSLayoutConstraint.constraints( withVisualFormat: "H:|[tempSpinner(30)]|", metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraints( withVisualFormat: "V:|[tempSpinner(30)]|", metrics: nil, views: views)
        if let center = appDelegate?.window?.center {
            tempSpinner.center = center
        }
        NSLayoutConstraint.activate(constraints)
        appDelegate?.window?.bringSubviewToFront(tempSpinner)
        return tempSpinner
    }()
    
    var updateLoadingStatus: (() -> Void)?
    
    var isLoading: Bool = false {
        didSet {
            updateLoadingStatus?()
        }
    }
    
    func setuploadingIndicator() {
        updateLoadingStatus = { [weak self] () in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.isLoading ? self.showSpinner() : self.hideSpinner()
            }
        }
    }
    
    func showSpinner() {
        spinner.startAnimating()
    }
    
    func hideSpinner() {
        spinner.stopAnimating()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
