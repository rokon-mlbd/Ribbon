//
//  RibbonView.swift
//  Ribbon
//
//  Created by Mohammed Rokon Uddin on 9/6/17.
//  Copyright © 2017 Mohammed Rokon Uddin. All rights reserved.
//

import UIKit

//@IBDesignable
class RibbonView: UIView {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    /// MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    /// Performs the initial setup.
    fileprivate func setupView() {
        let view = viewFromNibForClass()
        view.frame = bounds
//        view.autoresizingMask = [
//            UIViewAutoresizing.flexibleWidth,
//            UIViewAutoresizing.flexibleHeight
//        ]
        addSubview(view)
        self.backgroundColor = UIColor.red

    }

    /// Loads a XIB file into a view and returns this view.
    fileprivate func viewFromNibForClass() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }

    override func draw(_ rect: CGRect) {

        let mask = CAShapeLayer()
        mask.frame = self.layer.bounds

        let size = self.bounds.size
        let height = size.height
        let arrow = height * 0.5

        let p0 = self.bounds.origin
        let p1 = CGPoint(x:p0.x + size.width, y:p0.y)
        let p2 = CGPoint(x:p1.x, y:p1.y + height)
        let p3 = CGPoint(x:p0.x, y:p2.y)
        let p4 = CGPoint(x:arrow, y:arrow)

        /// create the path
        let path = CGMutablePath()
        path.move(to: p0)
        path.addLine(to: p1)
        path.addLine(to: p2)
        path.addLine(to: p3)
        path.addLine(to: p4)

        mask.path = path
        self.layer.mask = mask
        
    }
}
