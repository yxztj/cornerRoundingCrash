//
//  ViewController.swift
//  cornerClippingCrash
//
//  Created by Hang Yu on 2018/7/11.
//  Copyright © 2018 Hang Yu. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class ViewController: UIViewController {

    var node: ASDisplayNode? {
        didSet {
            oldValue?.view.removeFromSuperview()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        test()
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(2)) {
            self.test()
        }
    }
    
    func test() {
        let node = ASDisplayNode()
        self.view.addSubnode(node)
        node.frame = CGRect(x: 20, y: 20, width: 100, height: 100)
        
        node.cornerRoundingType = .clipping
        node.cornerRadius = 5
        node.backgroundColor = UIColor.green
        self.node = node
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

