//
//  OnboardingViewController.swift
//  smartTools
//
//  Created by Nicholas Forte on 30/12/21.
//

import UIKit

class OnboardingViewController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var btNext: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var slides: [OnboardSlide] = []
    
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            
            if currentPage == slides.count - 1 {
                btNext.setTitle("Get started", for: .normal)
            } else {
                btNext.setTitle("Next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
            
        self.slideContent()
    }
    
    func slideContent() {
        
        slides = [
            
            OnboardSlide(title: "Teste pagina 1", description: "Descrição da página 1", image: UIImage(named: "clip-car-service-support.png")!),
            OnboardSlide(title: "Teste pagina 2", description: "Descrição da página 2", image: UIImage(named: "arabica-car-service-2.png")!),
            OnboardSlide(title: "Teste pagina 3", description: "Descrição da página 3", image: UIImage(named: "lime-413.png")!)
            
        ]
        
    }
    
    @IBAction func newxtBtnClicked(_ sender: UIButton) {
         
        if currentPage == slides.count - 1 {
            
            let controller =
            storyboard?.instantiateViewController(withIdentifier: "homeNC") as! UINavigationController
            
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
            
            present(controller,animated: true, completion: nil)
            
        } else {
            
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }

}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.indentifier, for: indexPath) as! OnboardingCollectionViewCell
        
        cell.setUp(slides[indexPath.row])

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
    
}
