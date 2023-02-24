//
//  TabBar.swift
//  TVApp
//
//  Created by Shotiko Klibadze on 24.02.23.
//

import UIKit

typealias IntBlock = (Int) -> Void

final class TabBar: XibView {
    
    var onTapAction: IntBlock?
    
    @IBOutlet private weak var stackView: UIStackView!
    
    func configure(with items: [Item]) {
        items.enumerated().forEach { index, item in
            let view = TabBarItemView()
            view.configure(with: item) { [weak self, weak view] in
                guard let view = view else { return }
                self?.handleTap(on: view, with: index)
            }
            stackView.addArrangedSubview(view)
        }
    }
}

private extension TabBar {
    
    func deselectAllViews() {
        stackView.arrangedSubviews.forEach({
            ($0 as? TabBarItemView)?.isSelected = false
        })
    }
    
    func handleTap(on view: TabBarItemView, with index: Int) {
        deselectAllViews()
        view.isSelected = true
        onTapAction?(index)
    }
}
