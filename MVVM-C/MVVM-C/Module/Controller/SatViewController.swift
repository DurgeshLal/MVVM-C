//
//  SatViewController.swift
//  MVVM-C
//
//  Created by Durgesh Lal on 6/6/20.
//  Copyright © 2020 Durgesh Lal Gupta. All rights reserved.
//

import Foundation

class SatViewController: BaseViewController {
    
    private var viewModel: SchoolSatViewModel
    private var delegate: AppFlowCoordinating?
   
    private func internalSetup() {
        view.backgroundColor = .lightGray
    }
   
    required init(_ viewModel: SchoolSatViewModel = SchoolSatViewModel(), delegate: AppFlowCoordinating? = nil) {
        self.viewModel = viewModel
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
        self.setuploadingIndicator()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        internalSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.fetchSat()
    }
}


///Api
extension SatViewController {
    private func fetchSat() {
        isLoading = true
        viewModel.data.addAndNotify(observer: self) { [weak self] _ in
            guard let self = self else { return }
            self.isLoading = false
            print(self.viewModel.data)
        }
    }
}
