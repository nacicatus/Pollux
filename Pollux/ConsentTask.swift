//
//  ConsentTask.swift
//  Brainwash
//
//  Created by Saurabh Sikka on 2024. 03. 20..
//

import ResearchKit

public var ConsentTask: ORKOrderedTask {
    
    var steps = [ORKStep]()
    
    //TODO: Add VisualConsentStep
     
    let consentDocument = ConsentDocument
    let visualConsentStep = ORKVisualConsentStep(identifier: "VisualConsentStep", document: consentDocument)
    steps += [visualConsentStep]
    
    //TODO: Add ConsentReviewStep
    let signature = consentDocument.signatures!.first!

    let reviewConsentStep = ORKConsentReviewStep(identifier: "ConsentReviewStep", signature: signature, in: consentDocument)

    reviewConsentStep.text = "Review"
    reviewConsentStep.reasonForConsent = "Consent to join study"

    steps += [reviewConsentStep]
    
    return ORKOrderedTask(identifier: "ConsentTask", steps: steps)
}
