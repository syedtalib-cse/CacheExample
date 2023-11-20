//
//  ViewController.swift
//  CacheExample
//
//  Created by Talib on 13/06/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let button = UIButton()
        button.setTitle("TapMe", for:.normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action:#selector(didTapButton), for:.touchUpInside)
        button.frame = CGRect(x:0, y: 0, width:200, height:50)
        button.center = view.center
        view.addSubview(button)

    }
    func createTextField(){
        var myTextField = UITextField(frame:CGRect(x:20, y:500, width:300, height:30))
        var bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: myTextField.frame.height - 1, width: myTextField.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.blue.cgColor
        myTextField.borderStyle = UITextField.BorderStyle.none
        myTextField.layer.addSublayer(bottomLine)
        view.addSubview(myTextField)
    }
    
    @objc func didTapButton(){
        let vc = SecondViewController()
        present(vc, animated:true)
    }



}


