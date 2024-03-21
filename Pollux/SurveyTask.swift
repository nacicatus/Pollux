//
//  SurveyTask.swift
//  Pollux
//
//  Created by Saurabh Sikka on 2024. 03. 20..
//  Copyright © 2024. Yajnavalkya. All rights reserved.
//

import ResearchKit

public var SurveyTask: ORKOrderedTask {
    
    var steps = [ORKStep]()
    
    // Intro
    let instructionStep = ORKInstructionStep(identifier: "intro")
    instructionStep.title = "Test your Faith"
    instructionStep.text = "Answer three questions"
    
    steps += [instructionStep]
    
    //Text Input Question
    let nameAnswerFormat = ORKTextAnswerFormat(maximumLength: 20)
    nameAnswerFormat.multipleLines = false
    let nameQuestionStepTitle = "What is your name?"
    let nameQuestionStep = ORKQuestionStep(identifier: "NameStep", title: nameQuestionStepTitle, answer: nameAnswerFormat)

    steps += [nameQuestionStep]
    
    //Image Input Question
    let moodQuestion = "What is your Faith?"
    let moodImages = [
        (UIImage(named: "Hindu")!, "Hinduism"),
        (UIImage(named: "Islam")!, "Islam"),
        (UIImage(named: "Christian")!, "Christianity"),
        ]
    let moodChoice : [ORKImageChoice] = moodImages.map {
        return ORKImageChoice(normalImage: $0.0, selectedImage: nil, text: $0.1, value: $0.1 as NSCoding & NSCopying & NSObjectProtocol)
    }
    let answerFormat: ORKImageChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: moodChoice)
    let moodQuestionStep = ORKQuestionStep(identifier: "MoodStep", title: moodQuestion, answer: answerFormat)

    steps += [moodQuestionStep]
    
    //Numeric Input Question
    let ageQuestion = "How old are you?"
    let ageAnswer = ORKNumericAnswerFormat.integerAnswerFormat(withUnit: "years")
    ageAnswer.minimum = 18
    ageAnswer.maximum = 85
    let ageQuestionStep = ORKQuestionStep(identifier: "AgeStep", title: ageQuestion, answer: ageAnswer)

    steps += [ageQuestionStep]
    
    
    //Summary
    let completionStep = ORKCompletionStep(identifier: "SummaryStep")
    completionStep.title = "Thank You!!"
    completionStep.text = "You have completed the survey"

    steps += [completionStep]
    
    
    return ORKOrderedTask(identifier: "SurveyTask", steps: steps)
}

