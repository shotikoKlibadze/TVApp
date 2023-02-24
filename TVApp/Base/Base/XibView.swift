//
//  XibView.swift
//  TVApp
//
//  Created by Shotiko Klibadze on 24.02.23.
//

import UIKit

class XibView: UIView {

    // MARK: - IBOutlets
    @IBOutlet weak var contentView: UIView!

    // MARK: - Initialization and logic
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    public func setupView() {
        let bundle = Bundle(for: classForCoder)
        let coderClass = String(describing: classForCoder)
        bundle.loadNibNamed(coderClass, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}
