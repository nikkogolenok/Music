//
//  ViewController.swift
//  Music
//
//  Created by Никита Коголенок on 22.03.22.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Variable
    var songs = [Song]()
    
    // MARK: - Outlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createDelegate()
    }
    
    // MARK: - Methods
    private func createDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}
