//
//  HomeViewController.swift
//  SportsShop
//
//  Created by apple on 15/01/24.
//

import UIKit
var buttonVlaue = Int()

class HomeViewController: UIViewController {
    //outlets
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var HomeSlideCollectonView: UICollectionView!
    
    @IBOutlet weak var batButtonOutlet: UIButton!
    @IBOutlet weak var ballButtonOutlet: UIButton!
    @IBOutlet weak var jersyButtonOutlet: UIButton!
    
    @IBOutlet weak var logOutButtonOutlet: UIButton!
    @IBOutlet weak var profileButtonOutlet: UIButton!
    @IBOutlet weak var bootButtonOutlet: UIButton!
    
    // variables
    var slideImages = ["bootsSlide","batsSlide","jersySlides"]
    var timer: Timer?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupBackgroundAnimations()
        setupBackgroundAnimations()
        batButtonOutlet.layer.cornerRadius = 25
        ballButtonOutlet.layer.cornerRadius = 25
        jersyButtonOutlet.layer.cornerRadius = 25
        bootButtonOutlet.layer.cornerRadius = 25
        profileButtonOutlet.layer.cornerRadius = 25
        logOutButtonOutlet.layer.cornerRadius = 25
        startImageSlideTimer()
    }
    func startImageSlideTimer() {
           timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(updateImageSlide), userInfo: nil, repeats: true)
       }
    @objc func updateImageSlide() {
            let currentIndexPath = getCurrentIndexPath()
            let nextIndexPath = IndexPath(item: (currentIndexPath.item + 1) % slideImages.count, section: 0)
            
            HomeSlideCollectonView.scrollToItem(at: nextIndexPath, at: .centeredHorizontally, animated: true)
            pageControl.currentPage = nextIndexPath.item
        }
    func getCurrentIndexPath() -> IndexPath {
            let visibleRect = CGRect(origin: HomeSlideCollectonView.contentOffset, size: HomeSlideCollectonView.bounds.size)
            let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
            if let indexPath = HomeSlideCollectonView.indexPathForItem(at: visiblePoint) {
                return indexPath
            }
            return IndexPath(item: 0, section: 0)
        }

    @IBAction func backButtonMain(_ sender: Any) {
        let backViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
        navigationController?.pushViewController(backViewController, animated: true)
    }
    

    @IBAction func btnAction(_ sender: UIButton) {
        print(sender.tag)
        buttonVlaue = sender.tag
        addShadowWithAnimation(to: sender)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.removeShadowWithAnimation(from: sender)
        }
        switch sender.tag{
        case 4:
            let secondViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
                        navigationController?.pushViewController(secondViewController, animated: true)
        default:
            let secondViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "itemsCollectionViewController") as! itemsCollectionViewController
                        navigationController?.pushViewController(secondViewController, animated: true)
        }
        
        
    }
    func addShadowWithAnimation(to button: UIButton) {
        let shadowAnimation = CABasicAnimation(keyPath: "shadowOpacity")
        shadowAnimation.fromValue = 0
        shadowAnimation.toValue = 0.5
        shadowAnimation.duration = 0.3
        
        button.layer.shadowColor = UIColor.green.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.5
        button.layer.add(shadowAnimation, forKey: "shadowOpacity")
    }
    func removeShadowWithAnimation(from button: UIButton) {
        let shadowAnimation = CABasicAnimation(keyPath: "shadowOpacity")
        shadowAnimation.fromValue = 0.5
        shadowAnimation.toValue = 0
        shadowAnimation.duration = 0.3
        
        button.layer.shadowOpacity = 0
        button.layer.add(shadowAnimation, forKey: "shadowOpacity")
    }
    
}
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = HomeSlideCollectonView.dequeueReusableCell(withReuseIdentifier: "slideImage", for: indexPath)as! slideImageCollectionViewCell
        cell.imageOutlet.image = UIImage(named: slideImages[indexPath.row])
        pageControl.currentPage = indexPath.row
        return cell
    }
    
    
}
