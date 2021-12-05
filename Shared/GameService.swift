//
//  GameService.swift
//  otus-ios-professional
//
//  Created by Igor Kim on 05.12.21.
//

import Foundation

struct Score: Identifiable {
    var id: UUID = .init()
    var score: Int
}

class GameService: ObservableObject {
    @Published var numberOfSteps: Int = 2
    
    @Published private(set) var isRunning: Bool = false
    @Published private(set) var leaderboard: [Score] = []
    
    @Published private(set) var currentChoices: [Int] = []
    @Published private(set) var correctChoice: Int = 0
    @Published private(set) var taskText: String = ""
    
    private var numberOfChoices: Int = 2
    private var score: Int = 0
    private var stepsLeft: Int = 0
    
    func randInt() -> Int {
        return Int.random(in: 0..<100)
    }
    
    func nextStep() {
        let n1 = randInt()
        let n2 = randInt()
        
        taskText = "\(n1) + \(n2)"
        correctChoice = n1+n2
        
        currentChoices = (0...numberOfChoices-1).map { _ in
            randInt()
        }
        currentChoices.append(correctChoice)
        currentChoices.shuffle()
        
        stepsLeft -= 1
    }
    
    func start() {
        score = 0
        isRunning = true
        stepsLeft = numberOfSteps
        nextStep()
    }
    
    func stop() {
        isRunning = false
    }
    
    func choiceClicked(choiceID: Int) {
        if currentChoices[choiceID] == correctChoice {
            score += 1
        }
        if stepsLeft == 0 {
            leaderboard.append(Score(score: score))
            stop()
        } else {
            nextStep()
        }
    }
}
