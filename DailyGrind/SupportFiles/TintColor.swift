//
//  TintColor.swift
//  DailyGrind
//
//  Created by Joseph DeWeese on 4/3/24.
//
import SwiftUI
import SwiftData



/// Custom Tint Colors For Transaction Row
struct TintColor: Identifiable {
    let id: UUID = .init()
    var color: String
    var value: Color
}

var tints: [TintColor] = [
    ///gray
    .init(color: "colorGray1c", value: .colorGray1),
    .init(color: "colorGray2", value: .colorGray2),
    .init(color: "colorGray3", value: .colorGray3),
    .init(color: "colorGray4", value: .colorGray4),
    .init(color: "colorGray5", value: .colorGray5),
    .init(color: "colorGray6", value: .colorGray6),
    ///blue
    .init(color: "colorBlue ", value: .colorBlue),
    .init(color: "colorBlue2", value: .colorBlue2),
    .init(color: "colorBlue 4", value: .colorBlue4),
    ///green
    .init(color: "colorGreen ", value: .colorGreen),
    .init(color: "colorGreen1", value: .colorGreen1),
    .init(color: "colorGreen2", value: .colorGreen2),
    .init(color: "colorGreen3", value: .colorGreen3),
    ///red
    .init(color: "colorRed", value: .colorRed),
    .init(color: "colorRed1", value: .colorRed1),
    
    ///orange
    .init(color: "Orange", value: .colorOrange),
    .init(color: "Orange1", value: .colorOrange1),
    .init(color: "Orange2", value:.colorOrange2),
    ///pink
    .init(color: "Pink1", value: .colorPink1),
    .init(color: "Pink2", value: .colorPink2),
    ///purple
    .init(color: "Purple", value: .colorPurple),
    .init(color: "Purple1", value: .colorPurple1),
    .init(color: "Purple2", value: .colorPurple2),
 
]



