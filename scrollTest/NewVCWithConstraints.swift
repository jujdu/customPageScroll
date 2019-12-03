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
    let scrollView: UIScrollView = {
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
    
    var regularConstraints: [NSLayoutConstraint] = []
    var compactConstraints: [NSLayoutConstraint] = []
    var currentPage: CGFloat = 0

    //MARK: - Life cycle
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        //MARK: - Setup Front View
        view.addSubview(scrollView)
        scrollView.addSubview(contanerView)
        scrollView.addSubview(firstView)
        scrollView.addSubview(secondView)
        scrollView.addSubview(thirdView)
        scrollView.fillSuperview()
        contanerView.fillSuperview()
        scrollView.backgroundColor = .green
        contanerView.backgroundColor = .white
        setupCompactConstraits()
        setupRegularConstraits()
        activateConstraints()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { (_) in
            let xOffset = self.view.frame.width * self.currentPage
            self.scrollView.contentOffset = CGPoint(x: xOffset, y: 0)
        }, completion: nil)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        activateConstraints()
    }
    
    func setupRegularConstraits() {
        let widthToView = view.frame.width * 0.5 * 0.5
        regularConstraints = [
            contanerView.heightAnchor.constraint(equalTo: view.heightAnchor),
            firstView.leadingAnchor.constraint(equalTo: contanerView.leadingAnchor, constant: widthToView),
            firstView.centerYAnchor.constraint(equalTo: contanerView.centerYAnchor),
            firstView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            firstView.heightAnchor.constraint(equalTo: firstView.widthAnchor),
            secondView.leadingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: widthToView * 2),
            secondView.centerYAnchor.constraint(equalTo: contanerView.centerYAnchor),
            secondView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            secondView.heightAnchor.constraint(equalTo: secondView.widthAnchor),
            secondView.trailingAnchor.constraint(equalTo: contanerView.trailingAnchor, constant: -widthToView),
        ]
    }
    
    func setupCompactConstraits() {
        let widthToView = (view.frame.height * 0.5) - (view.frame.width * 0.5 * 0.5)
        print(widthToView)
        compactConstraints = [
            contanerView.heightAnchor.constraint(equalTo: view.heightAnchor),
            firstView.leadingAnchor.constraint(equalTo: contanerView.leadingAnchor, constant: widthToView),
            firstView.centerYAnchor.constraint(equalTo: contanerView.centerYAnchor),
            firstView.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            firstView.heightAnchor.constraint(equalTo: firstView.widthAnchor),
            secondView.leadingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: widthToView * 2),
            secondView.centerYAnchor.constraint(equalTo: contanerView.centerYAnchor),
            secondView.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            secondView.heightAnchor.constraint(equalTo: secondView.widthAnchor),
            secondView.trailingAnchor.constraint(equalTo: contanerView.trailingAnchor, constant: -widthToView),
        ]
    }
    
    func activateConstraints() {
        NSLayoutConstraint.deactivate(compactConstraints)
        NSLayoutConstraint.deactivate(regularConstraints)
        if self.traitCollection.verticalSizeClass == .regular {
            print("regular")
            NSLayoutConstraint.activate(regularConstraints)
        } else if traitCollection.verticalSizeClass == .compact {
            print("compact")
            NSLayoutConstraint.activate(compactConstraints)
        } else {
            print("unspec")
        }
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .allButUpsideDown
    }
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .portrait
    }
    
}

//MARK: - UIScrollViewDelegate
extension NewVCWithConstraints: UIScrollViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        currentPage = targetContentOffset.pointee.x / view.frame.width
    }
}
