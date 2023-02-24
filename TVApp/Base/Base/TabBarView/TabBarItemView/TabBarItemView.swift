//
//  TabBarItemView.swift
//  TVApp
//
//  Created by Shotiko Klibadze on 24.02.23.
//

import UIKit

final class TabBarItemView: XibView {
    
    @IBOutlet private weak var imageView: UIImageView!
    
    var isSelected: Bool = false {
        didSet {
            item?.isSelected = isSelected
            updateUI(isSelected: isSelected)
        }
    }
    
    private var onTapAction: VoidBlock?
    private var item: TabBar.Item?
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with item: TabBar.Item, onTap: VoidBlock?) {
        self.item = item
        onTapAction = onTap
        isSelected = item.isSelected
    }
    
    @IBAction func didTapOnView(_ sender: UITapGestureRecognizer) {
        onTapAction?()
    }
    
}

// MARK: - Private
private extension TabBarItemView {

    func updateUI(isSelected: Bool) {
        imageView.image = isSelected ? item?.selectedImage : item?.image
    }
}
