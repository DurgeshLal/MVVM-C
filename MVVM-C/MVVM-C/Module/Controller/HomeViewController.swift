//
//  HomeViewController.swift
//  MVVM-C
//
//  Created by Durgesh Lal Gupta on 3/13/19.
//  Copyright © 2019 Durgesh Lal Gupta. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    typealias CallBack = (_ object: School) -> Void
    
    private var viewModel: HomeViewModel
    private var callBack: CallBack?
    
    required init(_ viewModel: HomeViewModel, callBack: CallBack? = nil) {
        self.viewModel = viewModel
        self.callBack = callBack
        super.init(nibName: nil, bundle: nil)
        self.setuploadingIndicator()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setuploadingIndicator() {
        viewModel.updateLoadingStatus = { [weak self] () in
            guard let strongSelf = self else { return }
            DispatchQueue.main.async {
                let isLoading = strongSelf.viewModel.isLoading
                if isLoading {
                    strongSelf.showSpinner()
                } else {
                    strongSelf.hideSpinner()
                }
            }
        }
    }
    
    private lazy var tableView: UITableView = {
        let table = UITableView(frame:  view.bounds, style: .plain)
        table.separatorStyle = .singleLine
        table.tableFooterView = UIView()
        table.delegate = self
        table.dataSource = self
        table.estimatedRowHeight = 44.0
        table.rowHeight = UITableView.automaticDimension
        return table
    }()
    
    private func internalSetup() {
        view.backgroundColor = .red
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        let views: [String: Any] = ["tableView": tableView]
        var constraints: [NSLayoutConstraint] = []
        constraints += NSLayoutConstraint.constraints( withVisualFormat: "H:|[tableView]", metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraints( withVisualFormat: "V:|[tableView]", metrics: nil, views: views)
        NSLayoutConstraint.activate(constraints)
        
        tableView.register(SchooleListCell.self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        internalSetup()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadData()
    }
    
    private func reloadData() {
        tableView.reloadData()
    }
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        callBack?(viewModel.schoolAt(indexPath))
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let schoolViewModel = viewModel.dataForRowAtIndexPath(indexPath)
        let cell: SchooleListCell = tableView.dequeueReusableCell(forIndexPath: indexPath) as SchooleListCell
        cell.viewModel = schoolViewModel
        return cell
    }
}

