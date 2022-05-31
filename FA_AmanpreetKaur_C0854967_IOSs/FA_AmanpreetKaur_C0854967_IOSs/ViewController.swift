//
//  ViewController.swift
//  FA_AmanpreetKaur_C0854967_IOSs
//
//  Created by Amanpreet Kaur  on 2022-05-30.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    let appdelegate = UIApplication.shared.delegate as! AppDelegate
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
  

    var activeplayer=1
    var gameisActive=true
    var gameState=[0,0,0,0,0,0,0,0,0]
    var win=[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var x=0
    var y=0
    var temp=0
    var won=0
    var lastsender=0
    @IBOutlet weak var scorex: UILabel!
    @IBOutlet weak var scoreO: UILabel!
    
    @IBOutlet weak var wonmsg: UILabel!
    
    @IBAction func Ontap(_ sender: UIButton) {
        if (gameState[sender.tag-1]==0 && gameisActive==true)
        {
            lastsender=sender.tag
            gameState[sender.tag-1]=activeplayer
            if(activeplayer==1){
                sender.setImage(UIImage(named: "cross.png"), for: UIControl.State.normal)
                activeplayer=2
                
            }else{
                sender.setImage(UIImage(named: "circle.png"), for: UIControl.State.normal)
                activeplayer=1
            }
            
        }
        for w in win{
            if gameState[w[0]] != 0 && gameState[w[0]] == gameState[w[1]] && gameState[w[1]] == gameState[w[2]]{
            gameisActive=false
                resetout.isHidden=false
                if gameState[w[0]] == 1
                {wonmsg.text="Cross 'X' WON the game"
                    if temp==0
                    {x += 1
                     temp+=1
                     won=1}
                    scorex.text=String(x)}
                else
                {wonmsg.text="Circle 'O' WON the game"
                if temp==0
                {y += 1
                 temp+=1
                 won=1}
                 scoreO.text=String(y)
                }
                newgameOut.isHidden=false
                wonmsg.isHidden=false}}
        if gameState[0] != 0 && gameState[1] != 0 && gameState[2] != 0 && gameState[3] != 0 && gameState[4] != 0 && gameState[5] != 0 && gameState[6] != 0 && gameState[7] != 0 && gameState[8] != 0 && won == 0
        {wonmsg.text="Draw"
         gameisActive=false
         newgameOut.isHidden=false
         wonmsg.isHidden=false
         resetout.isHidden=false}
}
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
        newgameOut.isHidden=true
        wonmsg.isHidden=true
        scorex.text="0"
        scoreO.text="0"
        won = 0
        let swipeRight=UISwipeGestureRecognizer(target: self, action: #selector(swiped))
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeRight)
    }
    @objc func swiped(gesture: UISwipeGestureRecognizer)
    {
        let swipegesture = gesture as UISwipeGestureRecognizer
        switch swipegesture.direction
        {
        case .right:
            scorex.text=String("0")
            x=0
            y=0
            won=0
            scoreO.text=String("0")
            gameState=[0,0,0,0,0,0,0,0,0]
            gameisActive=true
            activeplayer=1
            newgameOut.isHidden=true
            wonmsg.isHidden=true
            temp=0
            for i in 1...9
            {
            let button=view.viewWithTag(i) as! UIButton
                button.setImage(nil, for:.normal)
            }
            resetout.isHidden=true
            
        default:
            break
        }
        
    }

    @IBOutlet weak var resetout: UILabel!
    @IBOutlet weak var newgameOut: UIButton!
    @IBAction func newgame(_ sender: Any) {
        gameState=[0,0,0,0,0,0,0,0,0]
        gameisActive=true
        activeplayer=1
        newgameOut.isHidden=true
        wonmsg.isHidden=true
        temp=0
        won=0
        for i in 1...9
        {
            let button=view.viewWithTag(i) as! UIButton
            button.setImage(nil, for:.normal)
        }
        
    }
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b9: UIButton!
    @IBOutlet weak var b8: UIButton!
    @IBOutlet weak var b7: UIButton!
    @IBOutlet weak var b6: UIButton!
    @IBOutlet weak var b5: UIButton!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b2: UIButton!
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake
        {print(lastsender)
         switch lastsender
        {case 1:
         print("1")
         b1.setImage(nil, for:.normal)
         gameState[lastsender-1]=0
         if activeplayer==2{activeplayer=1}else{activeplayer=2}
        default:
        break
            }
        }
    }
}

