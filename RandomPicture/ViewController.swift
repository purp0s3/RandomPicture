//
//  ViewController.swift
//  RandomPicture
//
//  Created by Lucas Nascimento on 26/08/23.
//

import UIKit

class ViewController: UIViewController {

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("gimme another one", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    let colors: [UIColor] = [
        .systemRed,
        .systemBlue,
        .systemGray,
        .systemMint,
        .systemPink,
        .systemTeal,
        .systemBrown,
        .systemGreen,
        .systemOrange,
        .systemPurple,
        .systemYellow
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPurple
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        view.addSubview(button)
        getRandomPicture()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc func didTapButton() {
        getRandomPicture()
        
        view.backgroundColor = colors.randomElement()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(x: 30, y: view.frame.size.height-150-view.safeAreaInsets.bottom, width: view.frame.size.width-60, height: 55)
    }
    
    func getRandomPicture() {
        let urlString = "https://source.unsplash.com/random/800x800"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url)
        else {
            return
        }
        imageView.image = UIImage(data: data)
    }
}


