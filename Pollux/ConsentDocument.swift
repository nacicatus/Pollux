//
//  ConsentDocument.swift
//  Brainwash
//
//  Created by Saurabh Sikka on 2024. 03. 20..
//

import ResearchKit

public var ConsentDocument: ORKConsentDocument {
    
    let consentDocument = ORKConsentDocument()
    consentDocument.title = "Agree to Test"
    
    //TODO: consent sections
    let consentSectionTypes: [ORKConsentSectionType] = [
        .overview,
        .dataGathering,
        //.privacy,
        .dataUse,
        .timeCommitment,
        .studySurvey,
        .studyTasks,
        .withdrawing
    ]
    
    let consentSections: [ORKConsentSection] = consentSectionTypes.map { contentSectionType in
        let consentSection = ORKConsentSection(type: contentSectionType)
        switch contentSectionType {
        case .overview:
            consentSection.summary = "Overview"
            consentSection.content = "This app will monitor your sleep hours, your heart rate patterns while dancing in kirtan or doing japa, and ask some questions to gauge the strength of your Bhakti."
        case .dataGathering:
            consentSection.summary = "Data Gathering"
            consentSection.content = "Data is gathered only on device"
        //            case .privacy:
        //                consentSection.summary = "Privacy"
        //                consentSection.content = "Privacy - Content"
        case .dataUse:
            consentSection.summary = "Data Use"
            consentSection.content = "Date will be used to create visualizations"
        case .timeCommitment:
            consentSection.summary = "Time Commitment"
            consentSection.content = "One week"
        case .studySurvey:
            consentSection.summary = "Study Survey"
            consentSection.content = "You will be asked some questions"
        case .studyTasks:
            consentSection.summary = "Study Tasks"
            consentSection.content = "You will be expected to dance in kirtan and do regular japa"
        case .withdrawing:
            consentSection.summary = "Withdrawing"
            consentSection.content = "You may withdraw at any time, but this will lose some score"
        default:
            break
        }
        
        
        return consentSection
    }
      
    
    consentDocument.sections = consentSections
    //TODO: signature
    
    consentDocument.addSignature(ORKConsentSignature(forPersonWithTitle: nil, dateFormatString: nil, identifier: "SellerSignature"))
    
    return consentDocument
}
