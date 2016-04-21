//
//  firstTableViewController.swift
//  bossZhiPingTransition
//
//  Created by zhn on 16/4/20.
//  Copyright © 2016年 zhn. All rights reserved.
//

import UIKit

class firstTableViewController: UITableViewController,UINavigationControllerDelegate {

    
    var selectedIndexPath:NSIndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        navigationController?.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 20
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        cell.textLabel?.text = "😄😄👌👌"
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        selectedIndexPath = indexPath
        let pushVC = secondTableViewController()
        pushVC.backImage = self.fullScreenShot()
        self.navigationController?.pushViewController(pushVC, animated: true)
        
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    
   
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    
        return bossPushTransition()
   
    }
    
    func fullScreenShot() -> UIImage{
       
        let screenWindow = UIApplication.sharedApplication().keyWindow;
        
        UIGraphicsBeginImageContext(screenWindow!.frame.size);//全屏截图，包括window
        screenWindow?.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let viewImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return viewImage
    }

    
    
}
