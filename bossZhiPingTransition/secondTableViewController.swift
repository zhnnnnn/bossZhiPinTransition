//
//  secondTableViewController.swift
//  bossZhiPingTransition
//
//  Created by zhn on 16/4/20.
//  Copyright © 2016年 zhn. All rights reserved.
//

import UIKit

class secondTableViewController: UITableViewController,UINavigationControllerDelegate{

    var backImage:UIImage?
    var percentDriven:UIPercentDrivenInteractiveTransition?
    var oldRect:CGRect?
    override func viewDidLoad() {
        super.viewDidLoad()
        oldRect = view.frame
    }

    override func viewWillAppear(animated: Bool) {
        navigationController?.delegate = self
    }
    
    override  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 25
    }
    
    
    override  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = "aaaaaaa"
        return cell
    }
    
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
       
        
        return bossPopTransition()
    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        if(scrollView.contentSize.height == 0){return}
        
        let currentHeight = scrollView.contentOffset.y + UIScreen.mainScreen().bounds.size.height
        var offsetY = currentHeight - scrollView.contentSize.height
        if(offsetY < 0){
            offsetY = 0
        }
        view.frame = CGRectMake(0, 0, view.frame.size.width, UIScreen.mainScreen().bounds.size.height - offsetY)
        // transform的效果不一样
        //        view.transform = CGAffineTransformMakeTranslation(0, offsetY)
    }
    
    override func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let currentHeight = scrollView.contentOffset.y + UIScreen.mainScreen().bounds.size.height
        var offsetY = currentHeight - scrollView.contentSize.height
        if(offsetY < 0){
            offsetY = 0
        }
        if(offsetY > (UIScreen.mainScreen().bounds.size.height)/2){
            navigationController?.popViewControllerAnimated(true)
        }else if(offsetY <= (UIScreen.mainScreen().bounds.size.height)/2 && offsetY != 0){
            UIView.animateWithDuration(0.3, delay: 0.0, usingSpringWithDamping: 0.1, initialSpringVelocity: 0.7, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
               
                self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, UIScreen.mainScreen().bounds.size.height)
                
                }, completion: nil)
        }
    }
    
    override func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
       
        let currentHeight = scrollView.contentOffset.y + UIScreen.mainScreen().bounds.size.height
        var offsetY = currentHeight - scrollView.contentSize.height
        if(offsetY < 0){
            offsetY = 0
        }
        if(offsetY > (UIScreen.mainScreen().bounds.size.height)/2){
            navigationController?.popViewControllerAnimated(true)
        }else if(offsetY <= (UIScreen.mainScreen().bounds.size.height)/2 && offsetY != 0){
            UIView.animateWithDuration(0.3, delay: 0.0, usingSpringWithDamping: 0.1, initialSpringVelocity: 0.7, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                
                self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, UIScreen.mainScreen().bounds.size.height)
                
                }, completion: nil)
        }
    }
    
    


}
