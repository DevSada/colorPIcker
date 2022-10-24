//
//  MainViewController.swift
//  colorPicker
//
//  Created by Alexander Petrenko on 21.10.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    var bgColor: UIColor = .white
    
    weak var colorMainDelegate: ColorRGBDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let colorVC = segue.destination as! RGBPickerViewController
        colorVC.colorDelegate = self
        colorVC.redSpectr = self.view.backgroundColor!.redValue*255
        colorVC.greenSpectr = self.view.backgroundColor!.greenValue*255
        colorVC.blueSpectr = self.view.backgroundColor!.blueValue*255
    }
}

extension MainViewController: ColorRGBDelegate {
    func getColorRGB(color: UIColor) {
        bgColor = color
        self.view.backgroundColor = color
    }
}

extension UIColor {
    var redValue: CGFloat{ return CIColor(color: self).red }
    var greenValue: CGFloat{ return CIColor(color: self).green }
    var blueValue: CGFloat{ return CIColor(color: self).blue }
    var alphaValue: CGFloat{ return CIColor(color: self).alpha }
}
