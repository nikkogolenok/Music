//
//  PlayerViewController.swift
//  Music
//
//  Created by Никита Коголенок on 22.03.22.
//

import UIKit
import AVFoundation

class PlayerViewController: UIViewController {
    
    // MARK: - Variable
    public var position = 0
    public var songs: [Song] = []
    var player: AVAudioPlayer?
    
    // MARK: - Outlet
    @IBOutlet weak var holder: UIView!
    
    // MARK: - GUI Variables
    private let albumImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let songNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
    }()
    
    private let artistNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
    }()
    
    private let albomNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
    }()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if holder.subviews.count == 0 {
            configure()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if let player = player {
            player.stop()
        }
    }
    
    // MARK: - Methods
    func configure() {
        let song = songs[position]
        
        let urlString = Bundle.main.path(forResource: song.trackName, ofType: "mp3")
        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            
            guard let urlString = urlString else { return }
            player = try AVAudioPlayer(contentsOf: URL(string: urlString)!)
            guard let player = player else { return }
            
            player.volume = 0.5
            player.play()
        }
        catch {
            print("Error ocorred")
        }
        configureUI()
    }
    
    func configureUI() {
        let song = songs[position]
        
        albumImageView.frame = CGRect(x: 10,
                                      y: 10,
                                      width: holder.frame.size.width - 20,
                                      height: holder.frame.size.width - 20)

        songNameLabel.frame = CGRect(x: 10,
                                     y: albumImageView.frame.size.height + 10,
                                     width: holder.frame.size.width - 20,
                                     height: 70)
        albomNameLabel.frame = CGRect(x: 10,
                                     y: albumImageView.frame.size.height + 10 + 70,
                                     width: holder.frame.size.width - 20,
                                     height: 70)
        artistNameLabel.frame = CGRect(x: 10,
                                       y: albumImageView.frame.size.height + 10 + 140,
                                       width: holder.frame.size.width - 20,
                                       height: 70)
        
        albumImageView.image = UIImage(named: song.imageName)
        songNameLabel.text = song.name
        artistNameLabel.text = song.artistName
        albomNameLabel.text = song.albomName
        
        holder.addSubview(albumImageView)
        holder.addSubview(songNameLabel)
        holder.addSubview(artistNameLabel)
        holder.addSubview(albomNameLabel)
        
        // Play controls
        let playPauseButton = UIButton()
        let nextButton = UIButton()
        let backButton = UIButton()
        
        // Frame
        let yPosition = artistNameLabel.frame.origin.y + 20 + 70
        let size: CGFloat = 80
        
        playPauseButton.frame = CGRect(x: (holder.frame.size.width - size) / 2.0,
                                       y: yPosition,
                                       width: size,
                                       height: size)
        
        nextButton.frame = CGRect(x: holder.frame.size.width - size - 20,
                                  y: yPosition,
                                  width: size,
                                  height: size)
        
        backButton.frame = CGRect(x: 20,
                                  y: yPosition,
                                  width: size,
                                  height: size)
        
        // Add action
        playPauseButton.addTarget(self, action: #selector(didTapPlayPauseButton), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        
        // Styling
        playPauseButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
        nextButton.setBackgroundImage(UIImage(systemName: "forward.fill"), for: .normal)
        backButton.setBackgroundImage(UIImage(systemName: "backward.fill"), for: .normal)
        
        playPauseButton.tintColor = .black
        nextButton.tintColor = .black
        backButton.tintColor = .black
        
        holder.addSubview(playPauseButton)
        holder.addSubview(nextButton)
        holder.addSubview(backButton)
        
        // slider
        let slider = UISlider(frame: CGRect(x: 20,
                                            y: holder.frame.size.height - 60,
                                            width: holder.frame.size.width - 40,
                                            height: 50))
        
        
        slider.value = 0.5
        slider.addTarget(self, action: #selector(didSliderSlider(_:)), for: .valueChanged)
        holder.addSubview(slider)
    }
    
    // MARK: - Action
    @objc func didTapPlayPauseButton() {
        
    }
    
    @objc func didTapNextButton() {
        
    }
    
    @objc func didTapBackButton() {
        
    }
    
    @objc func didSliderSlider(_ slider: UISlider) {
        let value = slider.value
        player?.volume = value
    }
}
