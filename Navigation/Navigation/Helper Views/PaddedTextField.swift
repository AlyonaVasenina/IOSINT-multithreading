//
//  PaddingUITextField.swift
//  Navigation
//
//  Created by Alena Vasenina on 02.12.2021.
//

import UIKit

class PaddedTextField: UITextField {

    var padding = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
