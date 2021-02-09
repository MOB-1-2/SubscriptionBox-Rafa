//
//  ViewController.swift
//  SubscriptionBox
//
//  Created by Rafa Vazquez on 2/1/21.
//

import UIKit

class ViewController: UIViewController {

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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(scrollView)
        setupScrollView()
        scrollView.addSubview(container)
        setupContainer()
        
        let firstPage = createOnboardingPage(message: "What is your favorite burger", imageName: "burger", color: #colorLiteral(red: 0, green: 0.6088068485, blue: 0.9130379558, alpha: 1))
        let secondPage = createOnboardingPage(message: "Favortie topings here", imageName: "topings", color: #colorLiteral(red: 0, green: 0.5895816684, blue: 0, alpha: 1))
        let thirdPage = createOnboardingPage(message: "Burger", imageName: "burg", color: #colorLiteral(red: 0.9391803145, green: 0.3987783194, blue: 1, alpha: 1))

        let pagesArray = [firstPage, secondPage, thirdPage]
        
        for page in pagesArray{
            page.translatesAutoresizingMaskIntoConstraints = false
            container.addArrangedSubview(page)
            page.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
        }
//            imageView.heightAnchor.constraint(equalTo: stackView.heightAnchor, constant: 0.6)
    }
    
    func setupScrollView() {
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    func setupContainer() {
        container.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        container.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        container.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        container.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        container.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
    }
    
    
    func createOnboardingPage(message: String, imageName: String, color: UIColor) -> UIView {
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
        return page
    }

}

