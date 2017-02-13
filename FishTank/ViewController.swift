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
    
    var rightFish = [#imageLiteral(resourceName: "fish1R"),#imageLiteral(resourceName: "fish2R"),#imageLiteral(resourceName: "fish3R"),#imageLiteral(resourceName: "fish4R"),#imageLiteral(resourceName: "fish5R"),#imageLiteral(resourceName: "fish6R"), #imageLiteral(resourceName: "fish7R"),#imageLiteral(resourceName: "fish8R"),#imageLiteral(resourceName: "fish9R")]
    var leftFish = [#imageLiteral(resourceName: "fish1L"),#imageLiteral(resourceName: "fish2L"),#imageLiteral(resourceName: "fish3L"),#imageLiteral(resourceName: "fish4L"),#imageLiteral(resourceName: "fish5L"),#imageLiteral(resourceName: "fish6L"),#imageLiteral(resourceName: "fish7L"),#imageLiteral(resourceName: "fish8L"),#imageLiteral(resourceName: "fish9L")]

    
    @IBOutlet var numFish: UISlider!
    @IBOutlet var RoundBorder: UIButton!
    
    func generateBubbles()
    {
        let wBubble = (Int(arc4random() % 10) + 1) * 3    //Bubble width between 3 to 30
        let hBubble = (wBubble * 3) / 4                   //height 75% of width
        let xPos = (Int(arc4random() % 736)) - wBubble    //Bubble starts at different horizontal spot
        let yStart = (Int(arc4random() % 90)+300)         //starts on bottom
        let yEnd = 0                                      //ends on top
                
        let bb = UIImageView()
        bb.image = #imageLiteral(resourceName: "bubble")
        bb.frame = CGRect(x: xPos, y: yStart, width: wBubble, height: hBubble)
        self.view.addSubview(bb)
        
        //Brings the button and slider on top of the bubbles
        numFish.layer.zPosition = 1.0
        RoundBorder.layer.zPosition = 1.0
        bb.layer.zPosition = 0.9
        
        //duration and delay for animation
        let aDur = Double(arc4random() % 10)+5         //duration between 5-15 seconds
        
        
        UIView.animate(
            withDuration: aDur,
            animations: {bb.frame = CGRect(x: xPos, y: yEnd, width: wBubble, height:hBubble)},
            completion: {animationFinished in bb.removeFromSuperview(); self.generateBubbles()}
        )
    }
    
    //Function moveRight : Fish move to the right
    func moveRight(ypos: Int, heightfish: Int, widthfish: Int, numberfish: Int)
    {
        let xStart = 0                                  //starts outside of left edge
        let xEnd = 736 - widthfish                      //ends outside of right edge

        
        let fishr = UIImageView()
        fishr.image = rightFish[numberfish]
        fishr.frame = CGRect(x: xStart, y: ypos, width: widthfish, height: heightfish)
        self.view.addSubview(fishr)
        
        
        //duration and delay for animation
        let aDur = Double(arc4random() % 15)+5         //duration between 5-20 seconds
        let aDelay = Double(arc4random() % 2)          // delay between 0 and 1 sec

        UIView.animate(
            withDuration: aDur,
            delay: aDelay,
            animations: {
                fishr.frame = CGRect(x: xEnd, y: ypos, width: widthfish, height:heightfish)
                        },
            completion: {
                animationFinished in fishr.removeFromSuperview();
                self.moveLeft(ypos: ypos, heightfish: heightfish, widthfish: widthfish, numberfish: numberfish)}
        )
    }

    
    //Function moveLeft : Fish move to the left
    func moveLeft(ypos: Int, heightfish: Int, widthfish: Int, numberfish: Int)
    {
        let xStart = 736 - widthfish                      //starts outside of right edge
        let xEnd = 0                                      //ends outside of left edge

        let fishl = UIImageView()
        fishl.image = leftFish[numberfish]
        fishl.frame = CGRect(x: xStart, y: ypos, width: widthfish, height: heightfish)
        self.view.addSubview(fishl)
        

        //duration and delay for animation
        let aDur = Double(arc4random() % 15)+5         // duration between 5-20 seconds
        let aDelay = Double(arc4random() % 2)          // delay between 0 and 1 sec

        UIView.animate(
            withDuration: aDur,
            delay: aDelay,
            animations: {
                fishl.frame = CGRect(x: xEnd, y: ypos, width: widthfish, height:heightfish)},
            completion: {
                animationFinished in fishl.removeFromSuperview();
                self.moveRight(ypos: ypos, heightfish: heightfish, widthfish: widthfish, numberfish: numberfish)})

    }
    
    

    @IBAction func animateFish(_ sender: Any)
    {
    let noOfFish = Int(roundf(self.numFish!.value))
        
        //Generates 20 bubbles
        for numb in 1...20
        {
            generateBubbles()
        }
    
         for fish in 1...noOfFish
         {
            let wFish = (Int(arc4random() % 10) + 10) * 6   //fish width between 50 to 120
            let hFish = (wFish * 3) / 4                     //height 75% of width
            let yPos = (Int(arc4random() % 290))            //fish starts at different vertical spot
            
            let fishnumber = Int(arc4random() % 9)          //Selects a random fish from the array
            
            //Calls function moveRight
            moveRight(ypos: yPos, heightfish: hFish, widthfish: wFish, numberfish: fishnumber)
        
        }
    }

}
