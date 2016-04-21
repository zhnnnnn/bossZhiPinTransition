//
//  bossPopTransition.swift
//  bossZhiPingTransition
//
//  Created by zhn on 16/4/20.
//  Copyright © 2016年 zhn. All rights reserved.
//

import UIKit

class bossPopTransition: NSObject,UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        
        let container = transitionContext.containerView()
        container?.insertSubview((toVC?.view)!, belowSubview: (fromVC?.view)!)
        toVC?.view.transform = CGAffineTransformMakeScale(0.8, 0.8)
        
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            fromVC?.view.frame = CGRectMake(0, -1000, UIScreen.mainScreen().bounds.size.width, 0)
            }) { (isTrue:Bool) -> Void in
                
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    
                   toVC?.view.transform = CGAffineTransformIdentity
                    
                    }, completion: { (isTrue:Bool) -> Void in
                        
                        transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
                })
        }
    }
    
}

