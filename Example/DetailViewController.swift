//
//  DetailViewController.swift
//  CBButtonLayout
//
//  Created by changcun on 20/11/2017.
//  Copyright © 2017 com.qcc. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    
    func configureView() {
        // Update the user interface for the detail item.
        if let imageAlignment = imageAlignment {
           
            if let button = button
            {
                button.setPadding(padding: 15, imageAlignment: imageAlignment)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var imageAlignment: ImageAlignment? {
        didSet {
            // Update the view.
            configureView()
        }
    }

    @IBAction func valueChanged(_ sender: UISlider) {
        
        if let button = button
        {
            button.setPadding(padding: CGFloat(sender.value), imageAlignment: imageAlignment!)
        }
    }
}

