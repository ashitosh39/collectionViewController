//
//  ViewController.swift
//  collectionViewController
//
//  Created by Macintosh on 11/12/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var studentCollectionView: UICollectionView!
    var studentName = ["ashu", "shailesh", "gajanan", "sambhaji","abhijit","rutik","unkown"]
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeCollectionView()
        registerXIBWithCollectionView()
        
        print(self.studentCollectionView.frame.width)
        
    }
    func initializeCollectionView(){
        studentCollectionView.dataSource = self
        studentCollectionView.delegate = self
    }
    func registerXIBWithCollectionView(){
        let uiNib = UINib(nibName: "CollectionViewCell", bundle: nil)
        self.studentCollectionView.register(uiNib,forCellWithReuseIdentifier : "CollectionViewCell")
    }
}

extension ViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        studentName.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let studentCollectionViewCell = self.studentCollectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        studentCollectionViewCell.backgroundColor = .brown
        studentCollectionViewCell.studentNameLable.text = studentName[indexPath.item]
        return studentCollectionViewCell
    }
}
extension ViewController : UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowlayout = collectionViewLayout as! UICollectionViewFlowLayout
        
        let speceBetweenTheCells : CGFloat = (flowlayout.minimumInteritemSpacing ?? 0.0 ) + (flowlayout.sectionInset.left ) + (flowlayout.sectionInset.right  )
        
        let size = (self.studentCollectionView.frame.width - speceBetweenTheCells) / 2.0
        return CGSize(width: size, height: size)
    }
}


