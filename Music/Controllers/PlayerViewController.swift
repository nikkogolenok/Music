//
//  PlayerViewController.swift
//  Music
//
//  Created by Никита Коголенок on 22.03.22.
//

import UIKit

class PlayerViewController: UIViewController {
    
    // MARK: - Variable
    public var position = 0
    public var songs: [Song] = []
    
    // MARK: - Outlet
    @IBOutlet weak var holder: UIView!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if holder.subviews.count == 1 {
            configure()
        }
    }
    
    // MARK: - Methods
    func configure() {
        
    }
}
