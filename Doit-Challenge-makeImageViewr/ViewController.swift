//
//  ViewController.swift
//  Doit-Challenge-makeImageViewr
//
//  Created by simyo on 2021/09/05.
//

import UIKit

class ViewController: UIViewController {
    let titleLabel = UILabel()
    let imageViewer = UIImageView()
    let prevButton = UIButton()
    let nextButton = UIButton()
    
    var imageIndex = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        imageViewer.backgroundColor = .purple
        
        titleLabel.text = "Image Viewer"
        prevButton.setTitle("이전", for: .normal)
        prevButton.setTitleColor(.black, for: .normal)
        nextButton.setTitle("다음", for: .normal)
        nextButton.setTitleColor(.black, for: .normal)
        imageViewer.image = UIImage(named: "1")
        
        prevButton.addTarget(self, action: #selector(prevButtonTapped(_:)), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(nextButtonTapped(_:)), for: .touchUpInside)
        
        setting()
    }
    
    func setting(){
        view.addSubview(titleLabel)
        view.addSubview(imageViewer)
        view.addSubview(prevButton)
        view.addSubview(nextButton)
        
        layout()
    }
    
    func layout(){
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        imageViewer.translatesAutoresizingMaskIntoConstraints = false
        prevButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            
            imageViewer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageViewer.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 60),
            
            imageViewer.widthAnchor.constraint(equalToConstant: 350),
            imageViewer.heightAnchor.constraint(equalToConstant: 500),
            
            prevButton.topAnchor.constraint(equalTo: imageViewer.bottomAnchor, constant: 50),
            prevButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            
            nextButton.centerYAnchor.constraint(equalTo: prevButton.centerYAnchor),
            nextButton.leadingAnchor.constraint(equalTo: prevButton.trailingAnchor, constant: 150)
        ])
    }

    @objc func prevButtonTapped(_ sender:UIButton){
        if imageIndex <= 1 {
            imageIndex = 1
        }
        else {
            imageIndex -= 1
        }
        imageViewer.image = UIImage(named: "\(imageIndex)")
    }
    
    @objc func nextButtonTapped(_ sender:UIButton){
        if imageIndex >= 6 {
            imageIndex = 6
        }
        else {
            imageIndex += 1
        }
        imageViewer.image = UIImage(named: "\(imageIndex)")
        
    }
}

