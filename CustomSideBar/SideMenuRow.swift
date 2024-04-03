//
//  SideMenuRow.swift
//  DailyGrind
//
//  Created by Joseph DeWeese on 4/3/24.
//

import SwiftUI

struct SideMenuRow: View {
  // MARK: - PROPERTIES
  
  var icon: String
  var firstText: String
  var secondText: String
  
  // MARK: - BODY
  
  var body: some View {
    HStack {
      ZStack {
        RoundedRectangle(cornerRadius: 8, style: .continuous)
          .fill(Color.colorBlue)
        Image(systemName: icon)
              .font(.title3)
              .fontWeight(.bold)
              .foregroundColor(.white)
      }
      .frame(width: 30, height: 30, alignment: .center)
      
        Text(firstText)
            .font(.title3)
            .fontWeight(.bold)
            .foregroundStyle(.white)
            .shadow(color: .black, radius: 2, x: 2, y: 1)
      Spacer()
      Text(secondText)
            .foregroundStyle(.colorGray1C)
    }
  }
}

// MARK: - PREVIEW

struct SideMenuRow_Previews: PreviewProvider {
  static var previews: some View {
    SideMenuRow(icon: "gear", firstText: "Application", secondText: "SavySpend")
      .previewLayout(.fixed(width: 375, height: 60))
      .padding()
  }
}
