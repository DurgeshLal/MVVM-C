//
//  HomeViewController.swift
//  MVVM-C
//
//  Created by Durgesh Lal Gupta on 3/13/19.
//  Copyright © 2019 Durgesh Lal Gupta. All rights reserved.
//

import UIKit

class HomeViewController<T: HomeViewModeling>: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var viewModel: T
    private var delegate: AppFlowCoordinating?
    
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
        view.backgroundColor = .lightGray
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
    
    private func reloadData() {
        tableView.reloadData()
    }
    
    required init(_ viewModel: T, delegate: AppFlowCoordinating? = nil) {
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
        configureTableView()
        reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.fetchList()
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
           tableView.deselectRow(at: indexPath, animated: true)
       }
       
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           //delegate?.coordinateToDetailWithItem(viewModel.itemAt(indexPath))
       }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return viewModel.numberOfRows
       }
       
       private func itemCell(_ indexPath: IndexPath, _ tableView: UITableView) -> UITableViewCell {
           let cell: SchooleListCell = tableView.dequeueReusableCell(forIndexPath: indexPath) as SchooleListCell
           let schoolViewModel = viewModel.dataForRowAtIndexPath(indexPath)
           cell.viewModel = schoolViewModel
           return cell
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           return itemCell(indexPath, tableView)
       }
}


///Api
extension HomeViewController {
    private func fetchList() {
        isLoading = true
        viewModel.data.addObserver(self) { [weak self] _ in
            guard let self = self else { return }
            self.isLoading = false
            self.tableView.reloadData()
        }
    }
}
