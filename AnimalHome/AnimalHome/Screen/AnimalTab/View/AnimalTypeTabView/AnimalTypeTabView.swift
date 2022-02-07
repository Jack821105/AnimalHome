//
//  AnimalTypeTabView.swift
//  AnimalHome
//
//  Created by 許自翔 on 2022/2/7.
//

import UIKit

protocol AnimalTypeTabViewDelegate: AnyObject {
    
    func didTapTabButon(for index: Int)
    
}

class AnimalTypeTabView: UIView {

    
    // MARK: - UI Properties
    
    private lazy var scrollView: UIScrollView = {
        return UIScrollView()
    }()
    
    private lazy var stackView: UIStackView = {
        return UIStackView()
    }()
    
    // MARK: - Properties
    
    private var tabButtons: [UIButton] = []
    
    private var horizontalBarViews: [UIView] = []
    
    private var horizontalBarViewHeights: [NSLayoutConstraint] = []

    private var currentTabButton: UIButton?
    
    weak var delegate: AnimalTypeTabViewDelegate?
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .themeColor
        setupScrollView()
        setupStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}


// MARK: - Setup Methods

extension AnimalTypeTabView {
    
    private func setupScrollView() {
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bounces = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(scrollView)
        scrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    private func setupStackView() {
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(stackView)
        stackView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor).isActive = true
    }
    
    private func setupTabButtons(with titles: [String]) {
        
        tabButtons.forEach { $0.removeFromSuperview() }
        tabButtons.removeAll()
        horizontalBarViews.forEach { $0.removeFromSuperview() }
        horizontalBarViews.removeAll()
        horizontalBarViewHeights.removeAll()
        stackView.subviews.forEach { $0.removeFromSuperview() }
        
        titles.enumerated().forEach {
        
            let tabButton = UIButton()
            tabButton.tag = $0.offset
            tabButton.setTitle($0.element, for: .normal)
            tabButton.setTitleColor(.gray134Color, for: .normal)
            tabButton.setTitleColor(.white, for: .selected)
            tabButton.titleLabel?.font = .getPintFang(ofSize: 16, weight: .medium)
            tabButton.titleLabel?.adjustsFontSizeToFitWidth = true
            tabButton.titleLabel?.baselineAdjustment = .alignCenters
            tabButton.isSelected = false
            tabButton.addTarget(self, action: #selector(tabButonTapped), for: .touchUpInside)
            tabButton.translatesAutoresizingMaskIntoConstraints = false
            tabButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 4).isActive = true
            tabButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
            
            let horizontalBarView = UIView()
            horizontalBarView.backgroundColor = .clear
            horizontalBarView.layer.cornerRadius = 1.5
            horizontalBarView.translatesAutoresizingMaskIntoConstraints = false
            tabButton.addSubview(horizontalBarView)
            horizontalBarView.leadingAnchor.constraint(equalTo: tabButton.leadingAnchor).isActive = true
            horizontalBarView.trailingAnchor.constraint(equalTo: tabButton.trailingAnchor).isActive = true
            horizontalBarView.bottomAnchor.constraint(equalTo: tabButton.bottomAnchor).isActive = true
            let horizontalBarViewHeight = horizontalBarView.heightAnchor.constraint(equalToConstant: 3)
            horizontalBarViewHeight.isActive = true
            
            tabButtons.append(tabButton)
            horizontalBarViews.append(horizontalBarView)
            horizontalBarViewHeights.append(horizontalBarViewHeight)
            stackView.addArrangedSubview(tabButton)
        }
    }
}

// MARK: - Custom Methods
    
extension AnimalTypeTabView {
    
    private func scrollToTabButton(_ button: UIButton) {
    
        currentTabButton?.isSelected = false
        currentTabButton?.titleLabel?.font = .getPintFang(ofSize: 16, weight: .medium)

        if !button.isSelected {
            button.isSelected = true
            button.titleLabel?.font = .getPintFang(ofSize: 18, weight: .medium)
            currentTabButton = button
            scrollToCenter(button)
                        
            horizontalBarViews.enumerated().forEach {
                
                if $0.offset == button.tag {
                    $0.element.backgroundColor = .white
                } else {
                    $0.element.backgroundColor = .clear
                }
            }
        }
    }
    
    private func scrollToCenter(_ button: UIButton) {
        
        let offsetX = max(0, min(button.center.x - (scrollView.frame.width / 2), scrollView.contentSize.width - scrollView.frame.width))
        
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
            
            self.scrollView.contentOffset = CGPoint(x: offsetX, y: button.frame.origin.y)
            
        }, completion: nil)
    }
}


// MARK: - API Methods

extension AnimalTypeTabView {
    
    func configure(with titles: [String]) {
        
        setupTabButtons(with: titles)
    }
    
    func scrollToTabButton(for index: Int) {
        
        for button in tabButtons where button.tag == index {
            
            scrollToTabButton(button)
        }
    }
}


// MARK: - Action Methods

extension AnimalTypeTabView {
    
    @objc private func tabButonTapped(_ button: UIButton) {
        
        guard !button.isSelected else { return }
        
        scrollToTabButton(button)
        
        delegate?.didTapTabButon(for: button.tag)
    }
}
