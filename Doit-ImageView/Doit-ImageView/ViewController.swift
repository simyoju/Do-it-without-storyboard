//
//  ViewController.swift
//  Doit-ImageView
//
//  확대 안되는 거 해결하기
//  스위치 디폴트 상태 변경ㅎ기
//  Created by simyo on 2021/09/05.
//

import UIKit

class ViewController: UIViewController {
    let imageView = UIImageView()
    let enlargeButton = UIButton()
    let onOffSwitch = UISwitch()
    
    var isZoom = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
//        onOffSwitch.backgroundColor = .red
        
        setting()
        
        imageView.image = UIImage(named: "lamp_off")
        enlargeButton.setTitle("확대", for: .normal)
        enlargeButton.setTitleColor(.blue, for: .normal)
        
        enlargeButton.addTarget(self, action:#selector(enlargeButtonTapped(_:)), for: .touchUpInside)
        onOffSwitch.addTarget(self, action: #selector(switchImage(_:)),for: .valueChanged)
    }
    
    func setting(){
        view.addSubview(imageView)
        view.addSubview(enlargeButton)
        view.addSubview(onOffSwitch)
        
        layout()
    }
    
    func layout(){
        imageView.translatesAutoresizingMaskIntoConstraints = false
        enlargeButton.translatesAutoresizingMaskIntoConstraints = false
        onOffSwitch.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 64),
            imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            
            imageView.widthAnchor.constraint(equalToConstant: 180),
            imageView.heightAnchor.constraint(equalToConstant: 300),
            
            enlargeButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 600),
            enlargeButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 60),
            enlargeButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 100),
            
            enlargeButton.widthAnchor.constraint(equalToConstant: 100),
            enlargeButton.heightAnchor.constraint(equalToConstant: 60),
            
//            onOffSwitch.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 600),
//            onOffSwitch.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 60),
//            onOffSwitch.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 60),
            onOffSwitch.centerYAnchor.constraint(equalTo: enlargeButton.centerYAnchor),
            onOffSwitch.leadingAnchor.constraint(equalTo: enlargeButton.trailingAnchor, constant: 10)
//            onOffSwitch.widthAnchor.constraint(equalToConstant: 100),
//            onOffSwitch.heightAnchor.constraint(equalToConstant: 60)
//
            
        ])
    }

    @objc func enlargeButtonTapped(_ sender:UIButton){
        let scale: CGFloat = 2.0
        var newWidth: CGFloat, newHeight: CGFloat
        
        if isZoom{
            newWidth = imageView.frame.width / scale
            newHeight = imageView.frame.height / scale
            enlargeButton.setTitle("확대", for: .normal)
            
        }else {
            newWidth = imageView.frame.width * scale
            newHeight = imageView.frame.height * scale
            enlargeButton.setTitle("축소", for: .normal)
        }
        
        imageView.frame.size = CGSize(width: newWidth, height: newHeight)
        isZoom = !isZoom
    }
    
    @objc func switchImage(_ sender: UISwitch){
        if sender.isOn {
            imageView.image = UIImage(named: "lamp_on")
        }else {
            imageView.image = UIImage(named: "lamp_off")
        }
    }
}

