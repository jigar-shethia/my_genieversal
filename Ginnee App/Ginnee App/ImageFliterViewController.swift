//
//  ImageFliterViewController.swift
//  Ginnee App
//
//  Created by Admin on 30/03/22.
//

import UIKit

class ImageFliterViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    var thubnailImages:[String]=["AU","AT","AS","BR","BQ"]
    
    @IBOutlet weak var imageCollectionview: UICollectionView!
    @IBOutlet weak var imagePreview: UIImageView!
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return thubnailImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = imageCollectionview.dequeueReusableCell(withReuseIdentifier: "imageCollectioViewCell", for: indexPath) as! ImageCollectionViewCell
        cell.images.image = UIImage(systemName: thubnailImages[indexPath.row])
        return cell
    }
    

    

    override func viewDidLoad() {
        super.viewDidLoad()
        imageCollectionview.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "imageCollectioViewCell")
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
