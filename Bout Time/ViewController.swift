//
//  ViewController.swift
//  Bout Time
//
//  Created by Joseph Kim on 12/30/16.
//  Copyright © 2016 Joseph Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Enums
    enum RoundButton {
        case win
        case lose
        case end
    }
    
    // Constants
    let numberOfRounds = 6
    let countDownDuartion = 60
    let roundButtonDefaultVerticalSpacing: CGFloat = 545
    let timerLabelDefaultVerticalSpacing: CGFloat = 545
    let descriptionDefaultVerticalSpacing: CGFloat = 593
    let roundButtonScoreVerticalSpacing: CGFloat = 360
    let timerLabelScoreVerticalSpacing: CGFloat = 260
    let descriptionScoreVerticalSpacing: CGFloat = 240
    
    // Variables
    var currentRound = 0
    var correctEvents = 0
    var events = Round()
    var eventSet: [Event] = []
    var currentEventOrder: [Int] = []
    var correctEventOrder: [Int] = []
    var roundEnd = false    // This flag is used to determine if the round has ended
    
    // Variables used for timers
    var currentCountdown = 0
    var countdownTimer = Timer()
    
    // Toggles if the device shake is enabled or not
    // This is mainly to prevent shake recognition in between rounds
    var canShake = true

    @IBOutlet weak var firstEventLabel: UILabel!
    @IBOutlet weak var secondEventLabel: UILabel!
    @IBOutlet weak var thirdEventLabel: UILabel!
    @IBOutlet weak var fourthEventLabel: UILabel!
    @IBOutlet weak var timerAndResultsLabel: UILabel!
    @IBOutlet weak var roundButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var timerAndResultsVerticalLabel: NSLayoutConstraint!
    @IBOutlet weak var roundButtonVertical: NSLayoutConstraint!
    @IBOutlet weak var descriptionVertical: NSLayoutConstraint!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var fourthButton: UIButton!
    @IBOutlet weak var fifthButton: UIButton!
    @IBOutlet weak var sixthButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupRound()
        displayEvents()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// Displays countdown timer
    func displayTimer() {
        if currentCountdown % 60 > 9 {
            timerAndResultsLabel.text = "\(currentCountdown / 60):\(currentCountdown % 60)"
        } else {
            timerAndResultsLabel.text = "\(currentCountdown / 60):0\(currentCountdown % 60)"
        }
    }

    /// Displays the events on the screen
    func displayEvents() {
        getEventSet()
        currentCountdown = countDownDuartion
        
        // Allows the player to shake the device to submit
        canShake = true
        
//        firstEventLabel.text = eventSet[0].event
//        secondEventLabel.text = eventSet[1].event
//        thirdEventLabel.text = eventSet[2].event
//        fourthEventLabel.text = eventSet[3].event
        
        firstEventLabel.text = "\(eventSet[0].event) - \(eventSet[0].year)"
        secondEventLabel.text = "\(eventSet[1].event) - \(eventSet[1].year)"
        thirdEventLabel.text = "\(eventSet[2].event) - \(eventSet[2].year)"
        fourthEventLabel.text = "\(eventSet[3].event) - \(eventSet[3].year)"
 
        timerAndResultsLabel.isHidden = false
        roundButton.isHidden = true
        descriptionLabel.text = "Shake to complete"
        
        
        // Runs the timer every second
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.timedEvent(_:)), userInfo: nil, repeats: true )
        displayTimer()
    }
    
    func displayScore() {
        timerAndResultsVerticalLabel.constant = timerLabelScoreVerticalSpacing
        roundButtonVertical.constant = roundButtonScoreVerticalSpacing
        descriptionVertical.constant = descriptionScoreVerticalSpacing
        timerAndResultsLabel.isHidden = false
        firstEventLabel.isHidden = true
        secondEventLabel.isHidden = true
        thirdEventLabel.isHidden = true
        fourthEventLabel.isHidden = true
        firstButton.isHidden = true
        secondButton.isHidden = true
        thirdButton.isHidden = true
        fourthButton.isHidden = true
        fifthButton.isHidden = true
        sixthButton.isHidden = true
        descriptionLabel.text = "Your Score"
        timerAndResultsLabel.text = "\(correctEvents)/\(numberOfRounds)"
    }
    
    func getEventSet() {
        eventSet = events.getRoundSet(for: 4)
        currentEventOrder = [eventSet[0].year, eventSet[1].year, eventSet[2].year, eventSet[3].year]
        let tempEvents = eventSet.sorted {$0.year < $1.year }
        correctEventOrder = [tempEvents[0].year, tempEvents[1].year, tempEvents[2].year, tempEvents[3].year]
    }
    
    func setupRound() {
        timerAndResultsVerticalLabel.constant = timerLabelDefaultVerticalSpacing
        roundButtonVertical.constant = roundButtonDefaultVerticalSpacing
        descriptionVertical.constant = descriptionDefaultVerticalSpacing
        firstEventLabel.isHidden = false
        secondEventLabel.isHidden = false
        thirdEventLabel.isHidden = false
        fourthEventLabel.isHidden = false
        firstButton.isHidden = false
        secondButton.isHidden = false
        thirdButton.isHidden = false
        fourthButton.isHidden = false
        fifthButton.isHidden = false
        sixthButton.isHidden = false
        roundButton.isHidden = true
    }
    
    /// Decrements the countdown variable and ends the round if the counter reaches zero
    func timedEvent(_ timer: Timer) {
        currentCountdown -= 1
        
        if currentCountdown == 0 {
            processUnshaken()
        }
        
        displayTimer()
    }
    
    func endOfEvent() {
        timerAndResultsLabel.isHidden = true
        roundButton.isHidden = false
        descriptionLabel.text = "Tap events to learn more"
    }
    
    
    /// Runs if the player fails to shake the device in time
    func processUnshaken() {
        // Invalidate the no-longer needed timer
        countdownTimer.invalidate()
        checkAnswer()
        endOfEvent()
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        //If the device was shaken, immediately finish the round
        if motion == .motionShake  && currentRound != numberOfRounds {
            countdownTimer.invalidate()
            checkAnswer()
            endOfEvent()
        }
    }
    
    /// Runs to see if the answer is correct
    func checkAnswer() {
        // If flagged as 'can't shake', return from the function right away
        if !canShake {
            return
        }
        
        // Change the flag so that the player can't shake again before starting a new round
        canShake = false
        
        let correct = currentEventOrder == correctEventOrder
        if correct {
            changeRoundButton(for: RoundButton.win)
            correctEvents += 1
        } else {
            changeRoundButton(for: RoundButton.lose)
        }
        
        currentRound += 1
    }
    
    func nextRound() {
        if currentRound == numberOfRounds {
            // Game is over
            roundEnd = true
            changeRoundButton(for: RoundButton.end)
            displayScore()
        } else {
            // Continue Game
            displayEvents()
        }
    }

    func changeRoundButton(for state: RoundButton) {
        switch state {
        case .win: roundButton.setImage(UIImage(named: "next_round_success"), for: .normal)
        case .lose: roundButton.setImage(UIImage(named: "next_round_fail"), for: .normal)
        case .end: roundButton.setImage(UIImage(named: "play_again"), for: .normal)
        }
    }
    
    @IBAction func playAgain() {
        if roundEnd {
            currentRound = 0
            correctEvents = 0
            setupRound()
            roundEnd = false
        }
        nextRound()
    }
    
    @IBAction func rearrangeButton(_ sender: UIButton) {
        //Check if countdown has expired. If it hasnt't, change index and text of specified labels
        if currentCountdown > 0 {
            switch sender {
            case firstButton, secondButton:
                // swap text for label 1 and label 2
                let secondLabelText = secondEventLabel.text
                secondEventLabel.text = firstEventLabel.text
                firstEventLabel.text = secondLabelText
                
                // swap answer index for label 1 and label 2
                let secondLabelIndex = currentEventOrder[1]
                currentEventOrder[1] = currentEventOrder[0]
                currentEventOrder[0] = secondLabelIndex
            case thirdButton, fourthButton:
                // swap text for label 2 and label 3
                let thirdLabelText = thirdEventLabel.text
                thirdEventLabel.text = secondEventLabel.text
                secondEventLabel.text = thirdLabelText
                
                // swap answer index for label 2 and label 3
                let thirdLabelIndex = currentEventOrder[2]
                currentEventOrder[2] = currentEventOrder[1]
                currentEventOrder[1] = thirdLabelIndex
            case fifthButton, sixthButton:
                // swap text for label 3 and label 4
                let fourthLabelText = fourthEventLabel.text
                fourthEventLabel.text = thirdEventLabel.text
                thirdEventLabel.text = fourthLabelText
                
                // swap answer index for label 3 and label 4
                let fourthLabelIndex = currentEventOrder[3]
                currentEventOrder[3] = currentEventOrder[2]
                currentEventOrder[2] = fourthLabelIndex
            default:
                print("This should never be printed if working correctly")
            }
        }
    }
}

