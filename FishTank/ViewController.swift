//
//  ViewController.swift
//  FishTank
//
//  Created by Prashant Saund on 2/8/17.
//  Copyright © 2017 MyOrg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let xRect = 0
    let yRect = 150
    let wRect = 80
    let hRect = 80
    
    @IBOutlet var numFish: UISlider!
    //@IBOutlet var numFish: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        //let fish = UIView()
      //  fish.backgroundColor = UIColor.red
        // Do any additional setup after loading the view, typically from a nib.
            }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func animateFish(_ sender: Any)
    {
        //while(true){
            animateForward()
        //animateForward, pass different ys, images as arguments
        //}

	}

    func animateForward(){
        let fish = UIImageView()
        fish.image = #imageLiteral(resourceName: "fish4")
        fish.frame = CGRect(x: xRect, y: yRect, width: wRect, height: hRect)
        self.view.addSubview(fish)
        UIView.animate(withDuration: 5.0, delay: 0.5,  animations:{ UIViewAnimationOptions.curveLinear
            //fish.backgroundColor = UIColor.cyan
            fish.frame = CGRect (x: self.xRect + 310,  y: self.yRect, width: self.wRect, height: self.hRect)
        },
                       completion: {(true) in
                        fish.removeFromSuperview()
                        self.animateReverse()
                        //self.iterationComplete = true
        })

    }
    
   func animateReverse(){
        let fish = UIImageView()
        fish.image = #imageLiteral(resourceName: "fish4-1")
        fish.frame = CGRect(x: 310, y: yRect, width: wRect, height: hRect)
        self.view.addSubview(fish)
        UIView.animate(withDuration: 5.0, delay: 0.2, animations:{
            //fish.backgroundColor = UIColor.cyan
            fish.frame = CGRect (x: self.xRect - 310,  y: self.yRect, width: self.wRect, height: self.hRect)
        },
                       completion: {animationFinished in
                        fish.removeFromSuperview()
                        self.animateForward()})

        
    }
    
    
   /* let noOfFish = Int(roundf(self.numFish!.value))
         for fishnum in 1...noOfFish
         {
            let wFish = (Int(arc4random() % 10) + 1) * 20  // fish width between 20 to 200
            let hFish = (wFish * 3) / 4                   // hight 75% of width
            let xStart = 0 - wFish                          //starts outside of left edge
            let xEnd = 370 - wFish                          //ends outside of right edge
            let yPos = (Int(arc4random() % 200)) + wFish    // fish starts at different vertica spot
            //duration and delay for animation
            let aDur = Double(arc4random() % 40)     // duration between 0-9 seconds
            let aDelay = Double(arc4random() % 10)       // delay between 0 and 1 sec
            let fish = UIImageView()
            fish.image = #imageLiteral(resourceName: "fish4")
            fish.frame = CGRect(x: xStart, y: yPos, width: wFish, height: hFish)
            self.view.addSubview(fish)
            UIView.animate(withDuration: aDur, delay: aDelay, options: [UIViewAnimationOptions.repeat], animations:{
                fish.frame = CGRect (x: xEnd, y: yPos, width: wFish, height: hFish)
            },
                           completion: { animationFinished in  fish.removeFromSuperview()
                            
            })
            
        } 
         
         
                  }*/
   }


