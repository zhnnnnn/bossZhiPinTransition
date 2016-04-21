//
//  bossPushTransition.swift
//  bossZhiPingTransition
//
//  Created by zhn on 16/4/20.
//  Copyright © 2016年 zhn. All rights reserved.
//

import UIKit

class bossPushTransition: NSObject,UIViewControllerAnimatedTransitioning {

    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        // push 前后的控制器
        let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) as! firstTableViewController
        let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) as! secondTableViewController
        
        let maskView = UIView()
        maskView.backgroundColor = UIColor.whiteColor()
        let rectInTableView = fromVC.tableView.rectForRowAtIndexPath(fromVC.selectedIndexPath!)
        let newRectInToView =  fromVC.tableView?.convertRect(rectInTableView, toView: fromVC.tableView.superview)
        maskView.frame = newRectInToView!
        
        // 容器
        let container = transitionContext.containerView()
        // 截屏
        let shootView = fromVC.view.snapshotViewAfterScreenUpdates(false)
        shootView.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height)
        container?.addSubview(shootView)
        shootView.alpha = 0
        shootView.transform = CGAffineTransformMakeScale(0.8, 0.8)
        
        UIView.animateWithDuration(self.transitionDuration(transitionContext), animations: { () -> Void in
            
            fromVC.view.transform = CGAffineTransformMakeScale(0.8, 0.8)
            container?.addSubview(maskView)
            
            
            }) { (isTure:Bool) -> Void in
                
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    
                        maskView.frame = CGRectMake(0, 0, 1000, 1000)
                    
                    }, completion: { (isTure:Bool) -> Void in
                        
                        container?.addSubview((toVC.view)!)
                        fromVC.view.transform = CGAffineTransformIdentity
                        maskView.removeFromSuperview()
                        shootView.alpha = 1
                        // 一定要加这步告诉系统结束了转场
                        transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
                })
        
        }
  
    }

}
