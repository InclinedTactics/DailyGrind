//
//  TransactionsView.swift
//  DailyGrind
//
//  Created by Joseph DeWeese on 4/3/24.
//

import SwiftUI
import SwiftData



struct TransactionsView: View {
    //MARK:  PROPERTIES
    
    /// View Properties
    @Binding var showMenu: Bool
    @State private var showFilterView: Bool = false
    @State private var startDate: Date = .now.startOfMonth
    @State private var endDate: Date = .now.endOfMonth
    @State private var addTransaction: Bool = false
    @State private var showMetrics: Bool = false
   // @State private var selectedCategory: Category = .expense
    @State private var selectedTransaction: Transaction?
    @State private var selectedTab = 0
    
    /// For Animation
    @Namespace private var animation
    
    var body: some View {
        GeometryReader {
            /// For Animation Purpose
            let size = $0.size
            NavigationStack{
                ScrollView(.vertical){
                    LazyVStack(spacing: 0.5, pinnedViews: [.sectionHeaders]){
                        //MARK: SECTION
                        Section{
                            ScrollView(.vertical){
                                LazyVStack(spacing: 5, pinnedViews: [.sectionHeaders]){
                                }
                            }.padding(.horizontal)
                        } header: {
                            HeaderView(size)
                        }.padding(2)
                    }
                }
            }
        }
    }
    //  MARK: Header View
          @ViewBuilder
          func HeaderView(_ size: CGSize) -> some View {
              NavigationStack{
                  HStack(spacing: 10) {
                      Button{
                          withAnimation{showMenu.toggle()}
                          HapticManager.notification(type: .success)
                      } label: {
                          VStack{
                              ZStack{
                                  RoundedRectangle(cornerRadius: 10.0)
                                      .fill(appTint)
                                      .frame(width: 47, height: 47)
                                      .shadow(color: .colorShadow, radius: 1, x: 1, y: 1)
                                  
                                  Image(systemName: "person.crop.rectangle")
                                      .resizable()
                                      .scaledToFit()
                                      .clipShape(RoundedRectangle(cornerRadius: 10.0))
                                      .frame(width: 42, height: 42)
                                      .foregroundStyle(.black)
                              }
                          }
                      }
                      Spacer()
                      HStack{
                          VStack(alignment: .leading, spacing: 2) {
                              Text("Welcome!")
                                  .fontDesign(.serif)
                                  .font(.title.bold())
                                  .padding(.leading)
                              
                              Text("...your personal Balance Sheet.")
                                  .font(.callout.bold())
                                  .fontDesign(.serif)
                                  .foregroundStyle(.secondary)
                          }
                      }
                      Spacer(minLength: 0)
                      NavigationLink {
                          AddTransaction()
                      } label: {
                          Image(systemName: "plus")
                              .font(.title3)
                              .fontWeight(.semibold)
                              .foregroundStyle(.white)
                              .frame(width: 42, height: 42)
                              .background(.blue, in: .rect(cornerRadius: 10.0))
                              .shadow(color: .colorShadow, radius: 1, x: 1, y: 1)
                      }
                  }
              }
                 // .blur(radius: showProfile ? 8 : 0)
                  .padding(.horizontal,7)
                  .background {
                      VStack(spacing: 0) {
                          Rectangle()
                              .fill(.clear)
                      }
                      .visualEffect { content, geometryProxy in
                          content
                              .opacity(headerBGOpacity(geometryProxy))
                      }
                      .padding(.top, -(safeArea.top + 15))
                  }
                  ZStack {
                      HStack{
                          ///MARK:  DATE FILTER BUTTON
                          Button {
                              showFilterView = true
                              HapticManager.notification(type: .success)
                          }  label: {
                              Image(systemName: "calendar")
                                  .font(.title)
                                  .foregroundStyle(.primary)
                              Text("\(format(date: startDate,format: "dd MMM yy")) - \(format(date: endDate,format: "dd MMM yy"))")
                                  .font(.system(size: 18))
                                  .fontDesign(.serif)
                                  .fontWeight(.bold)
                                  .foregroundStyle(.primary)
                                  .frame(width: 200)
                          }
                          .padding(10)
                          .padding(.horizontal)
                          .frame(width: 250)
                          .background {
                              RoundedRectangle(cornerRadius: 10, style: .continuous)
                                  .fill(.colorGray3.gradient)
                                  .hSpacing(.center)
                          }
                      }.hSpacing(.center)
                      
                      Spacer()
                      ///MARK:  BUTTON MENU
                      
                          .frame(width: 372)
                  }
              }
    func headerBGOpacity(_ proxy: GeometryProxy) -> CGFloat {
        let minY = proxy.frame(in: .scrollView).minY + safeArea.top
        return minY > 0 ? 0 : (-minY / 15)
    }
    func headerScale(_ size: CGSize, proxy: GeometryProxy) -> CGFloat {
        let minY = proxy.frame(in: .scrollView).minY
        let screenHeight = size.height
        
        let progress = minY / screenHeight
        let scale = (min(max(progress, 0), 1)) * 0.4
        
        return 1 + scale
    
}
}

