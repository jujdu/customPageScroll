//
//  NewVCWithConstraints.swift
//  scrollTest
//
//  Created by Michael Sidoruk on 28.11.2019.
//  Copyright © 2019 Michael Sidoruk. All rights reserved.
//

import UIKit

class NewVCWithConstraints: UIViewController {
    
    //MARK: - Front Views
    let contentScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .clear
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    let contanerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
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
//        contentScrollView.addSubview(contanerView)
        view.addSubview(contentScrollView)
        view.addSubview(pageControl)
        contentScrollView.fillSuperview()
//        contanerView.fillSuperview()
//        let contanerViewWidthAnchor = contanerView.widthAnchor.constraint(equalTo: view.widthAnchor)
//        contanerView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
//        contanerViewWidthAnchor.isActive = true

        if UIDevice.current.orientation.isPortrait {
            firstView.leadingAnchor.constraint(equalTo: contentScrollView.leadingAnchor, constant: view.frame.width * 0.5 * 0.5).isActive = true
            firstView.centerYAnchor.constraint(equalTo: contentScrollView.centerYAnchor).isActive = true
            firstView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
            firstView.heightAnchor.constraint(equalTo: firstView.widthAnchor).isActive = true

            secondView.leadingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: (view.frame.width * 0.5 * 0.5) * 2).isActive = true
            secondView.centerYAnchor.constraint(equalTo: contentScrollView.centerYAnchor).isActive = true
            secondView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
            secondView.heightAnchor.constraint(equalTo: secondView.widthAnchor).isActive = true

            secondView.trailingAnchor.constraint(equalTo: contentScrollView.trailingAnchor, constant: -(view.frame.width * 0.5 * 0.5)).isActive = true
        } else {
            firstView.leadingAnchor.constraint(equalTo: contentScrollView.leadingAnchor, constant: view.frame.width * 0.5 * 0.5).isActive = true
            firstView.centerYAnchor.constraint(equalTo: contentScrollView.centerYAnchor).isActive = true
            firstView.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
            firstView.heightAnchor.constraint(equalTo: firstView.widthAnchor).isActive = true

            secondView.leadingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: (view.frame.width * 0.5 * 0.5) * 2).isActive = true
            secondView.centerYAnchor.constraint(equalTo: contentScrollView.centerYAnchor).isActive = true
            secondView.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
            secondView.heightAnchor.constraint(equalTo: secondView.widthAnchor).isActive = true

            secondView.trailingAnchor.constraint(equalTo: contentScrollView.trailingAnchor, constant: -(view.frame.width * 0.5 * 0.5)).isActive = true
        }

        pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }

}

extension NewVCWithConstraints: UIScrollViewDelegate {
    
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

