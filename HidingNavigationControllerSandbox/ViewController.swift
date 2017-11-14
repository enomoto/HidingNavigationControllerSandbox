//
//  ViewController.swift
//  HidingNavigationControllerSandbox
//
//  Created by kenta.enomoto on 2017/11/14.
//  Copyright © 2017年 kenta.enomoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let NavigationHidingOffsetHeight: CGFloat = 44
    var scrollBeginningPoint: CGPoint!
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        scrollBeginningPoint = scrollView.contentOffset
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard scrollBeginningPoint != nil else { return }

        if scrollBeginningPoint.y < scrollView.contentOffset.y - NavigationHidingOffsetHeight {
            navigationController?.setNavigationBarHidden(true, animated: true)
        } else if scrollBeginningPoint.y > scrollView.contentOffset.y + NavigationHidingOffsetHeight {
            navigationController?.setNavigationBarHidden(false, animated: true)
        }
    }
}

