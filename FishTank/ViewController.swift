//
//  ViewController.swift
//  FishTank
//
//  Created by Prashant Saund on 2/8/17.
//  Copyright © 2017 MyOrg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background")!)
        RoundBorder.layer.cornerRadius = 4
    }
    
    var rightFish = [#imageLiteral(resourceName: "fish1R"),#imageLiteral(resourceName: "fish2R"),#imageLiteral(resourceName: "fish3R"),#imageLiteral(resourceName: "fish4R"),#imageLiteral(resourceName: "fish5R"),#imageLiteral(resourceName: "fish6R")]
    var leftFish = [#imageLiteral(resourceName: "fish1L"),#imageLiteral(resourceName: "fish2L"),#imageLiteral(resourceName: "fish3L"),#imageLiteral(resourceName: "fish4L"),#imageLiteral(resourceName: "fish5L"),#imageLiteral(resourceName: "fish6L")]

    
    @IBOutlet var numFish: UISlider!
    @IBOutlet var RoundBorder: UIButton!
    
    
    //Function ........ : Fish move to the right
    func moveRight(Fish:Int)
    {}

    
    
    
    //Function ........ : Fish move to the right
    func moveLeft(Fish:Int)
    {}
    
    
    func flip(){}

    
    
    @IBAction func animateFish(_ sender: Any)
    {
    let noOfFish = Int(roundf(self.numFish!.value))
         for fishnum in 1...noOfFish
         {
            let wFish = (Int(arc4random() % 10) + 10) * 6   //fish width between 50 to 120
            let hFish = (wFish * 3) / 4                     //height 75% of width
            let xStart = 0 - wFish                          //starts outside of left edge
            let xEnd = 736 - wFish                          //ends outside of right edge
            let yPos = (Int(arc4random() % 290))            //fish starts at different vertical spot
            
            //duration and delay for animation
            let aDur = Double(arc4random() % 35) + 5        // duration between 5-40 seconds
            let aDelay = Double(arc4random() % 10)          // delay between 0 and 9 sec
            
            let fishnumber = Int(arc4random() % 5)          //Selects a random fish from the array
            
            let fishr = UIImageView()
            fishr.image = rightFish[fishnumber]
            fishr.frame = CGRect(x: xStart, y: yPos, width: wFish, height: hFish)
            self.view.addSubview(fishr)
            
            UIView.animate(withDuration: aDur, delay: aDelay, options: [UIViewAnimationOptions.repeat],
                           animations:{fishr.frame = CGRect (x: xEnd, y: yPos, width: wFish, height: hFish)},
                           completion: {animationFinished in fishr.removeFromSuperview()})
            /*
            let fishl = UIImageView()
            fishl.image = leftFish[fishnumber]
            fishl.frame = CGRect(x: xStart, y: yPos, width: wFish, height: hFish)
            self.view.addSubview(fishl)
            
            UIView.transition(from: fishr, to: fishl, duration: 1, options: UIViewAnimationOptions.transitionFlipFromRight, completion: nil)
            */

        
        }
    }

}
