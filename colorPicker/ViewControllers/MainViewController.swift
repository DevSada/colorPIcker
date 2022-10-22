//
//  MainViewController.swift
//  colorPicker
//
//  Created by Alexander Petrenko on 21.10.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let colorVC = segue.destination as! RGBPickerViewController
        colorVC.colorDelegate = self
    }
    
}

extension MainViewController: ColorRGBDelegate {
    func getColorRGB(color: UIColor) {
        self.view.backgroundColor = color
    }
}
