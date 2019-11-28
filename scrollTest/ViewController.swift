//
//  ViewController.swift
//  scrollTest
//
//  Created by Michael Sidoruk on 28.11.2019.
//  Copyright © 2019 Michael Sidoruk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Front Views
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = true
        scrollView.backgroundColor = .blue
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
        return view
    }()
    
    let pictureBG: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "pictureBG")
        imageView.backgroundColor = .cyan
        imageView.contentMode = .scaleAspectFill
        return imageView
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
    
    let cloudBG: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "cloudBG")
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .clear
//        imageView.alpha = 0.8
        return imageView
    }()
    
    let cloudBG1: UIImageView = {
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
    
    var currentPage: CGFloat = 0 {
        willSet {
            let generator = UIImpactFeedbackGenerator(style: .medium)
            if newValue != self.currentPage {
                generator.impactOccurred()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        //MARK: - Setup Front Views
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(pictureBG)
        scrollView.addSubview(cloudBG1)
        scrollView.addSubview(pageControl)
        pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
         cloudBG1.anchor(top: scrollView.topAnchor, leading: scrollView.leadingAnchor, bottom: scrollView.bottomAnchor, trailing: scrollView.trailingAnchor, padding: UIEdgeInsets(top: 0, left: -200, bottom: 0, right: -200), size: .zero)
        
        scrollView.frame = CGRect(x: 0,
                                  y: 0,
                                  width: self.view.frame.width,
                                  height: self.view.frame.height)
        scrollView.contentSize = CGSize(width: self.view.frame.width * 3,
                                        height: self.view.frame.height)
        containerView.frame = CGRect(x: 0,
                                     y: 0,
                                     width: self.view.frame.width * 3,
                                     height: self.view.frame.height)

        pictureBG.frame = CGRect(x: 0,
                                 y: 0,
                                 width: containerView.frame.width,
                                 height: containerView.frame.height)
        containerView.anchor(top: scrollView.topAnchor,
                             leading: scrollView.leadingAnchor,
                             bottom: scrollView.bottomAnchor,
                             trailing: scrollView.trailingAnchor,
                             padding: .zero,
                             size: CGSize(width: scrollView.contentSize.width,
                                          height: scrollView.contentSize.height))
        pictureBG.anchor(top: scrollView.topAnchor, leading: scrollView.leadingAnchor, bottom: scrollView.bottomAnchor, trailing: scrollView.trailingAnchor, padding: UIEdgeInsets(top: 0, left: -200, bottom: 0, right: -200), size: .zero)

        scrollView.addSubview(firstView)
        scrollView.addSubview(secondView)
        scrollView.addSubview(thirdView)
        
        firstView.frame = CGRect(x: (scrollView.contentSize.width / 3) * 0.25,
                                 y: (scrollView.contentSize.height * 0.5) - scrollView.frame.width * 0.25,
                                 width: scrollView.frame.width * 0.5,
                                 height: scrollView.frame.width * 0.5)
        
        secondView.frame = CGRect(x: (scrollView.contentSize.width / 3) + ((scrollView.contentSize.width / 3) * 0.25),
                                  y: (scrollView.contentSize.height * 0.5) - scrollView.frame.width * 0.25,
                                  width: scrollView.frame.width * 0.5,
                                  height: scrollView.frame.width * 0.5)
        
        thirdView.frame = CGRect(x: ((scrollView.contentSize.width / 3) * 2) + ((scrollView.contentSize.width / 3) * 0.25),
                                 y: (scrollView.contentSize.height * 0.5) - scrollView.frame.width * 0.25,
                                 width: scrollView.frame.width * 0.5,
                                 height: scrollView.frame.width * 0.5)
        //MARK: - Setup Back Views

        
        scrollView.addSubview(cloudBG)
        cloudBG.anchor(top: scrollView.topAnchor, leading: scrollView.leadingAnchor, bottom: scrollView.bottomAnchor, trailing: scrollView.trailingAnchor, padding: UIEdgeInsets(top: 0, left: -200, bottom: 0, right: -600), size: .zero)
    }


}

extension ViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print(scrollView.contentOffset)
        let xOffset = scrollView.contentOffset.x * 0.3
        let contentRectXOffset = xOffset / cloudBG.frame.size.width
        cloudBG.layer.contentsRect = CGRect(x: contentRectXOffset, y: 0, width: 1, height: 1)
        
        let xOffset1 = scrollView.contentOffset.x * 0.4
        let contentRectXOffset1 = xOffset1 / cloudBG1.frame.size.width
        cloudBG1.layer.contentsRect = CGRect(x: contentRectXOffset1, y: 0, width: 1, height: 1)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        currentPage = targetContentOffset.pointee.x / view.frame.width
        pageControl.currentPage = Int(currentPage)
    }
}

