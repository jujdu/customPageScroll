//
//  NewVC.swift
//  scrollTest
//
//  Created by Michael Sidoruk on 28.11.2019.
//  Copyright © 2019 Michael Sidoruk. All rights reserved.
//

import UIKit

class NewVC: UIViewController {
    
    //MARK: - Front Views
    let contentScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = true
        scrollView.backgroundColor = .clear
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    let firstView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .yellow
        return view
    }()
    
    let secondView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemPink
        return view
    }()
    
    let thirdView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .orange
        return view
    }()
    
    //MARK: - Back Views
    
    let pictureBG: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "pictureBG")
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    
    let cloudBG1: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "cloudBG")
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .clear
        //        imageView.alpha = 0.8
        return imageView
    }()
    
    let cloudBG2: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "cloudBG1")
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        imageView.alpha = 0.8
        return imageView
    }()
    
    //MARK: - Bottom Views
    let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.numberOfPages = 3
        pageControl.pageIndicatorTintColor = .systemPink
        pageControl.currentPageIndicatorTintColor = .green
        return pageControl
    }()
    
    //MARK: - Properties
    var currentPage: CGFloat = 0 {
        willSet {
            if currentPage != newValue {
                let generator = UIImpactFeedbackGenerator(style: .medium)
                generator.impactOccurred()
            }
        }
    }
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        contentScrollView.delegate = self
        
        //MARK: - Setup Back Views
        view.addSubview(pictureBG)
        view.addSubview(cloudBG2)
        view.addSubview(cloudBG1)
        
        pictureBG.anchor(top: view.topAnchor,
                         leading: view.leadingAnchor,
                         bottom: view.bottomAnchor,
                         trailing: view.trailingAnchor,
                         padding: UIEdgeInsets(top: 0, left: -200, bottom: 0, right: -200),
                         size: .zero)
        cloudBG2.anchor(top: view.topAnchor,
                        leading: view.leadingAnchor,
                        bottom: view.bottomAnchor,
                        trailing: view.trailingAnchor,
                        padding: UIEdgeInsets(top: 0, left: -200, bottom: 0, right: -200),
                        size: .zero)
        cloudBG1.anchor(top: view.topAnchor,
                        leading: view.leadingAnchor,
                        bottom: view.bottomAnchor,
                        trailing: view.trailingAnchor,
                        padding: UIEdgeInsets(top: 0, left: -200, bottom: 0, right: -600),
                        size: .zero)
        
        //MARK: - Setup Front View
        contentScrollView.addSubview(firstView)
        contentScrollView.addSubview(secondView)
        contentScrollView.addSubview(thirdView)
        view.addSubview(contentScrollView)
        view.addSubview(pageControl)
        contentScrollView.frame = CGRect(x: 0,
                                         y: 0,
                                         width: self.view.frame.width,
                                         height: self.view.frame.height)
        contentScrollView.contentSize = CGSize(width: self.view.frame.width * 3,
                                               height: self.view.frame.height)
        firstView.frame = CGRect(x: (contentScrollView.contentSize.width / 3) * 0.25,
                                 y: (contentScrollView.contentSize.height * 0.5) - contentScrollView.frame.width * 0.25,
                                 width: contentScrollView.frame.width * 0.5,
                                 height: contentScrollView.frame.width * 0.5)
        secondView.frame = CGRect(x: (contentScrollView.contentSize.width / 3) + ((contentScrollView.contentSize.width / 3) * 0.25),
                                  y: (contentScrollView.contentSize.height * 0.5) - contentScrollView.frame.width * 0.25,
                                  width: contentScrollView.frame.width * 0.5,
                                  height: contentScrollView.frame.width * 0.5)
        thirdView.frame = CGRect(x: ((contentScrollView.contentSize.width / 3) * 2) + ((contentScrollView.contentSize.width / 3) * 0.25),
                                 y: (contentScrollView.contentSize.height * 0.5) - contentScrollView.frame.width * 0.25,
                                 width: contentScrollView.frame.width * 0.5,
                                 height: contentScrollView.frame.width * 0.5)
        pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }

}

extension NewVC: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        generateHorizontalScrollAnimation(to: pictureBG, in: scrollView, velocity: 0.1)
        generateHorizontalScrollAnimation(to: cloudBG1, in: scrollView, velocity: 0.2)
        generateHorizontalScrollAnimation(to: cloudBG2, in: scrollView, velocity: 0.3)
    }
    
    private func generateHorizontalScrollAnimation(to view: UIView, in scrollView: UIScrollView, velocity: CGFloat) {
        let xOffset = scrollView.contentOffset.x * velocity
        let contentRectXOffset = xOffset / view.frame.size.width
        view.layer.contentsRect = CGRect(x: contentRectXOffset, y: 0, width: 1, height: 1)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        currentPage = targetContentOffset.pointee.x / view.frame.width
        pageControl.currentPage = Int(currentPage)
    }
}

