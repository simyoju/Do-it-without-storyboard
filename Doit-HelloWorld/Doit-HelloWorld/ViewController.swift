//
//  ViewController.swift
//  Doit-HelloWorld
//
//  Created by simyo on 2021/09/04.
//

import UIKit

class ViewController: UIViewController {
    let label1 = UILabel()
    let label2 = UILabel()
    let label3 = UILabel()
    
    let textField = UITextField()
    
    let sendButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        makeLabel()
        makeTextField()
        makeButton()
        
        sendButton.addTarget(self, action: #selector(sendButtonTapped(_:)), for: .touchUpInside)
    
    }
    
    func makeLabel(){
        label1.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(label1)
        label2.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(label2)
        label3.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(label3)
        
        label1.text = "Hello"
        label2.text = "This is SWIFT World!!"
        label3.text = "Name: "
        
        NSLayoutConstraint.activate([
            label1.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            label1.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            label2.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 15),
            label3.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            label3.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: 15)
        ])
        
        
        label1.textColor = .blue
        label1.font = UIFont.systemFont(ofSize: 20)
    }
    
    func makeTextField(){
        self.view.addSubview(textField)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: 15),
            textField.leadingAnchor.constraint(equalTo: label3.trailingAnchor, constant: 5),
            
            textField.widthAnchor.constraint(equalToConstant: 100)
            
        ])
        
        textField.backgroundColor = .yellow
    }
    
    func makeButton(){
        
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sendButton)
        
        sendButton.setTitle("Send", for: .normal)
        sendButton.setTitleColor(.gray, for: .normal)
        
        NSLayoutConstraint.activate([
            sendButton.topAnchor.constraint(equalTo: label3.bottomAnchor, constant: 15),
            sendButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])

    }
    
    @objc func sendButtonTapped(_ sender: UIButton){
        label1.text = "hello " + textField.text!
    }
    


}

