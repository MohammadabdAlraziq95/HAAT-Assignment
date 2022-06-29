//
//  CarouselView.swift
//  HAAT-Assignment
//
//  Created by Mo Raziq on 6/27/22.
//

import UIKit

class CarouselView: UIView {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var carouselCollectionView: UICollectionView!
    
    let images: [String] = ["deal"]
    let nibName = "CarouselView"
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit() {
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        carouselCollectionView.register(CarouselCollectionViewCell.self, forCellWithReuseIdentifier: "carouselViewCell")
        carouselCollectionView.delegate = self
        carouselCollectionView.dataSource = self
        self.addSubview(view)
    }
    
    func loadViewFromNib() -> UIView? {
        let nib = UINib(nibName: nibName, bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
}
extension CarouselView: UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "carouselViewCell", for: indexPath) as? CarouselCollectionViewCell
        cell?.populateData(imageName: self.images[indexPath.row])
        return cell!
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = self.carouselCollectionView.frame.size
        return size
    }
}

