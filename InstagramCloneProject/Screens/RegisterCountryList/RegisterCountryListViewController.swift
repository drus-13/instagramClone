//
//  RegisterCountryListViewController.swift
//  InstagramCloneProject
//
//  Created by Andrey Dolgov on 21.11.2020.
//

import UIKit

final class RegisterCountryListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: RegisterCountryListViewModel!
    
    private var presenters: [RegisterCountryPresenter] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel.delegate = self
        self.viewModel.load()
        
        self.configureTableView()
        
        self.title = Localization.string(key: "register.countryList.title", defaultValues: "")
        self.prepareUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func prepareUI() {
        self.view.backgroundColor = Theme.with(color: .viewBackgroundColor)
        self.navigationController?.navigationBar.barTintColor = Theme.with(color: .viewBackgroundColor)
        self.navigationItem.hidesBackButton = true
        
        let cancelButton = UIBarButtonItem(title: Localization.string(key: "register.countryList.cancel", defaultValues: ""), style: .plain, target: self, action: #selector(self.cancelButtonTapped))
        
        cancelButton.tintColor = Theme.with(color: .navigationColor)
        cancelButton.setTitleTextAttributes([.font: Font.with(size: .heading, weight: .regular, family: .text)], for: .normal)
        self.navigationItem.leftBarButtonItems = [cancelButton]
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: Font.with(size: .heading, weight: .semibold, family: .text), NSAttributedString.Key.foregroundColor: Theme.with(color: .navigationColor)]
    }
    
    private func configureTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.sectionHeaderHeight = 42
        self.tableView.rowHeight = 44
        self.tableView.tableHeaderView = nil
        
        self.tableView.register(nibWithClass: RegisterCountryListTableViewCell.self)
        self.tableView.register(headerFooterViewClass: RegisterCountryListHeaderFooterView.self)
    }
    
    @objc private func cancelButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }

}

extension RegisterCountryListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel.didSelectRow(at: indexPath.row)
    }
}

extension RegisterCountryListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withClass: RegisterCountryListTableViewCell.self, for: indexPath)
        cell.presenter = self.presenters[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let headerView = tableView.dequeueReusableHeaderFooterView(withClass: RegisterCountryListHeaderFooterView.self) {
            headerView.configure()
            return headerView
        }
        return nil
    }
    
    
}

extension RegisterCountryListViewController: RegisterCountryListViewModelDelegate {
    
    func updateView(_ presenters: [RegisterCountryPresenter]) {
        self.presenters = presenters
        self.tableView.reloadData()
    }
    
    func dismissViewController() {
        self.navigationController?.popViewController(animated: true)
    }
}
