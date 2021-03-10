//
//  ViewController.swift
//  SubscriptionBox
//
//  Created by Rafa Vazquez on 2/1/21.
//

import UIKit

class OnboardingVC: UIViewController {
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        
        return scrollView
    }()
    let container: UIStackView = {
        let container = UIStackView()
        container.axis = .horizontal
        container.spacing = 0
        container.distribution = .fillEqually
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.pageIndicatorTintColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 0, green: 1, blue: 0, alpha: 1)
        pageControl.currentPage = 0
        return pageControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        setupScrollView()
        scrollView.addSubview(container)
        setupContainer()
        
        let firstPage = createOnboardingPage(message: "Tell us about your dogs personality", imageName: "cautious_dog", color: #colorLiteral(red: 0, green: 0.6088068485, blue: 0.9130379558, alpha: 1), isLastPage: false)
        let secondPage = createOnboardingPage(message: "Subscribe to your first box", imageName: "walking_dog", color: #colorLiteral(red: 0, green: 0.5895816684, blue: 0, alpha: 1), isLastPage: false)
        let thirdPage = createOnboardingPage(message: "Get snacks and toys your dog will love", imageName: "good_dog", color: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), isLastPage: true)
        
        let pagesArray = [firstPage, secondPage, thirdPage]
        
        for page in pagesArray{
            page.translatesAutoresizingMaskIntoConstraints = false
            container.addArrangedSubview(page)
            page.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
        }
        view.addSubview(pageControl)
        pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 50).isActive = true
        pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        pageControl.numberOfPages = pagesArray.count
    }
    
    func setupScrollView() {
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.delegate = self
    }
    func setupContainer() {
        container.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        container.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        container.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        container.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        container.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
    }
    
    func createOnboardingPage(message: String, imageName: String, color: UIColor, isLastPage: Bool) -> UIView {
        let page = UIView()
        
        let stackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.spacing = 20
            stackView.distribution = .fill
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
        }()
        
        let imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        let messageLabel: UILabel = {
            let messageLabel = UILabel()
            messageLabel.numberOfLines = 0
            messageLabel.textAlignment = .center
            messageLabel.font = UIFont(name: "Helvetica", size: 20)
            messageLabel.textColor = UIColor(white: 1.0, alpha: 0.8)
            return messageLabel
        }()
        
        let continueButton: UIButton = {
            let continueButton = UIButton()
            continueButton.setTitle("Continue", for: .normal)
            continueButton.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
            continueButton.layer.cornerRadius = 10
            continueButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.8470588235)
            
            return continueButton
        }()
        
        page.addSubview(stackView)
        
        stackView.widthAnchor.constraint(equalTo: page.layoutMarginsGuide.widthAnchor, multiplier: 0.5).isActive = true
        stackView.heightAnchor.constraint(equalTo: page.layoutMarginsGuide.heightAnchor, multiplier: 0.5).isActive = true
        stackView.centerYAnchor.constraint(equalTo: page.centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: page.centerXAnchor).isActive = true
        
        
        stackView.addArrangedSubview(imageView)
        imageView.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.6).isActive = true
        stackView.addArrangedSubview(messageLabel)
        
        imageView.image = UIImage(named: imageName)
        messageLabel.text = message
        page.backgroundColor = color
        
        if isLastPage {
            stackView.addArrangedSubview(continueButton)
            continueButton.widthAnchor.constraint(equalTo: page.widthAnchor, multiplier: 0.5).isActive = true
            continueButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
            continueButton.addTarget(self, action: #selector(setContinueButton), for: .touchUpInside)
        }
    
        return page
    }
    @objc func setContinueButton() {
        let loginVC: LoginVC = LoginVC()
        self.navigationController?.pushViewController(loginVC, animated: true)


    }
}

extension OnboardingVC: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = Int(round(scrollView.contentOffset.x / scrollView.frame.size.width))
        pageControl.currentPage = page
    }
}


