//
//  ViewController.swift
//  Ribbon
//
//  Created by Mohammed Rokon Uddin on 9/6/17.
//  Copyright © 2017 Mohammed Rokon Uddin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UICollectionViewDataSource {


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! RibbonCell
        cell.configureCell()
        return cell
    }
}


class RibbonCell: UICollectionViewCell {

    @IBOutlet weak var ribbonViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var ribbonView: RibbonView!

    override func awakeFromNib() {

    }

    func configureCell() {
        ribbonViewWidthConstraint.constant = CGFloat(arc4random_uniform(UInt32(self.bounds.width - 100) ) + 50)
        self.layoutIfNeeded()
    }
}
