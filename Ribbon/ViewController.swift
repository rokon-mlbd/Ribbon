//
//  ViewController.swift
//  Ribbon
//
//  Created by Mohammed Rokon Uddin on 9/6/17.
//  Copyright © 2017 Mohammed Rokon Uddin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    fileprivate let data = ["Hello",
                        "World",
                        "Life is beautiful",
                        "Swift is awesome",
                        "There is always hope",
                        "Monstar Lab Bangladesh Ltd.",
                        "Nodes Agency",
                        "I love to move it move it",
                        "Abcd Efg Ijkl Mnop asdf asdf asdf asdf ",
                        "asdf asdf 4rw ewrw faf wr wewr rqwerer",
                        "t adsf wer y t t q we g get f etw sdfasdfasdfasfs s",
                        "weSfsf fwerwrw ewr werwwer rwe rrw r wrertew",
                        "Afefwrewrew wrw rer ewr we rwr",
                        "asdf sadf a sdf rw wer wr wrwerwe"]
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
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! RibbonCell
        cell.configureCell(data[indexPath.row])
        return cell
    }
}


class RibbonCell: UICollectionViewCell {

    @IBOutlet weak var ribbonView: RibbonView!

    override func awakeFromNib() {

    }

    func configureCell(_ text: String) {
        ribbonView.title.text = text
        ribbonView.setNeedsDisplay()
    }
}
