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
        configureSong()
    }
    
    // MARK: - Methods
    func createDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func configureSong() {
        songs.append(Song(name: "Background music", albomName: "123 Other", artistName: "Rnado", imageName: "cover1", trackName: "song1"))
        songs.append(Song(name: "Havana", albomName: "Havana album", artistName: "Camilla Cabello", imageName: "cover2", trackName: "song2"))
        songs.append(Song(name: "Viva La Vida", albomName: "123 Something", artistName: "Coldplay", imageName: "cover3", trackName: "song3"))
        songs.append(Song(name: "Background music", albomName: "123 Other", artistName: "Rnado", imageName: "cover1", trackName: "song1"))
        songs.append(Song(name: "Havana", albomName: "Havana album", artistName: "Camilla Cabello", imageName: "cover2", trackName: "song2"))
        songs.append(Song(name: "Viva La Vida", albomName: "123 Something", artistName: "Coldplay", imageName: "cover3", trackName: "song3"))
        songs.append(Song(name: "Background music", albomName: "123 Other", artistName: "Rnado", imageName: "cover1", trackName: "song1"))
        songs.append(Song(name: "Havana", albomName: "Havana album", artistName: "Camilla Cabello", imageName: "cover2", trackName: "song2"))
        songs.append(Song(name: "Viva La Vida", albomName: "123 Something", artistName: "Coldplay", imageName: "cover3", trackName: "song3"))
        songs.append(Song(name: "Background music", albomName: "123 Other", artistName: "Rnado", imageName: "cover1", trackName: "song1"))
        songs.append(Song(name: "Havana", albomName: "Havana album", artistName: "Camilla Cabello", imageName: "cover2", trackName: "song2"))
        songs.append(Song(name: "Viva La Vida", albomName: "123 Something", artistName: "Coldplay", imageName: "cover3", trackName: "song3"))
        songs.append(Song(name: "Background music", albomName: "123 Other", artistName: "Rnado", imageName: "cover1", trackName: "song1"))
        songs.append(Song(name: "Havana", albomName: "Havana album", artistName: "Camilla Cabello", imageName: "cover2", trackName: "song2"))
        songs.append(Song(name: "Viva La Vida", albomName: "123 Something", artistName: "Coldplay", imageName: "cover3", trackName: "song3"))
    }
}
