//
//  SideMenu.swift
//  DailyGrind
//
//  Created by Joseph DeWeese on 4/3/24.
//

import SwiftUI

struct SideMenu: View {
    //MARK:  PROPERTIES
    
    @Binding var showMenu: Bool
    /// Import & Export Properties
    @State private var presentFilePicker: Bool = false
    @State private var presentShareSheet: Bool = false
    @State private var shareURL: URL = URL(string: "https://apple.com")!
    @State private var isLoading: Bool = false
    /// Alert Properties
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 0) {
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Image(systemName: "person.crop.rectangle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 65, height: 65)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .foregroundStyle(.black)
                    Text("JDeWeese")
                        .font(.title2.bold())
                        .fontWeight(.bold)
                        .fontDesign(.serif)
                        .foregroundStyle(.white)
                    Text("@inclinedTactics")
                        .font(.callout)
                        .foregroundStyle(.colorGray3)
                }
                .padding()
                .padding(.leading)
                Spacer()
                ///MARK:  SCROLL VIEW
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 10){
                        VStack(alignment: .leading, spacing: 20) {
                            // Side bar Buttons...
                            SideMenuRow(icon: "person", firstText: "Profile", secondText: "")
                            SideMenuRow(icon: "sun.max", firstText: "Display and Theme", secondText: "")
                            SideMenuRow(icon: "chart.bar.xaxis", firstText: "Charts", secondText: "")
                            SideMenuRow(icon: "gear", firstText: "Settings", secondText: "")
                            Divider()
                            VStack(alignment: .leading, spacing: 15) {
                                
                                SideMenuRow(icon: "square.and.arrow.down", firstText: "Import Budget", secondText: "")
                                
                                
                                SideMenuRow(icon: "square.and.arrow.up", firstText: "Export Budget", secondText: "")
                                
                            }
                            .padding(.horizontal)
                            .padding(.leading, 10)
                            .padding(.bottom,10)
                        }
                        .foregroundStyle(.white)
                        .padding(.horizontal)
                        .padding(.leading, 2)
                        .padding(.top,15)
                        
                        Divider()
                            .padding(.vertical)
                        
                        VStack(alignment: .leading, spacing: 15) {
                            
                            SideMenuRow(icon: "lock.shield", firstText: "Privacy & Security", secondText: "")
                            SideMenuRow(icon: "envelope", firstText: "Support / Feedback", secondText: "")
                            Divider()
                        }
                        .padding(.horizontal)
                        .padding(.leading, 10)
                        .padding(.bottom,20)
                        
                    }
                }//scrollview
                HStack{
                    Text("InnovaCodeSolutions ")
                    Image(systemName: "c.circle")
                    Text("2024")
                }
                .padding([.horizontal,.top],65)
                // .padding(.bottom,safeArea().bottom == 0 ? 15 : 0)
                .foregroundColor(.secondary)
                .font(.caption2)
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            // Max Width...
            .frame(width: getRect().width - 90)
            .frame(maxHeight: .infinity)
            .background(
               appTint
                .ignoresSafeArea()
                  
            )
            .frame(maxWidth: .infinity,alignment: .leading)
        }
    }///var body some view
    //        /// For Exporting Expneses as JSON File
    //        .sheet(isPresented: $presentShareSheet) {
    //            deleteTempFile()
    //        } content: {
    //            CustomShareSheet(url: $shareURL)
    //        }
    //    }
    //    /// Importing JSON File and Adding to SwiftData
    //    func importJSON(_ url: URL) {
    //        isLoading = true
    //        DispatchQueue.global(qos: .userInteractive).asyncAfter(deadline: .now() + 1) {
    //            do {
    //                let jsonData = try Data(contentsOf: url)
    //                let decoder = JSONDecoder()
    //                let transactions = try decoder.decode([Transaction].self, from: jsonData)
    //                
    //                DispatchQueue.main.async {
    //                    for transaction in transactions {
    //                        context.insert(transaction)
    //                    }
    //                    isLoading = false
    //                    alertMessage = "File Imported Successfully!"
    //                    showAlert.toggle()
    //                    /// Updating Widgets
    //                    WidgetCenter.shared.reloadAllTimelines()
    //                }
    //            } catch {
    //                /// DO ACTION
    //                displayAlert(error)
    //            }
    //        }
    //    }
    //    
    //    /// Exporting SwiftData to JSON File
    //    func exportTransactions() {
    //        isLoading = true
    //        Task.detached(priority: .high) {
    //            try? await Task.sleep(for: .seconds(1))
    //            /// Step 1:
    //            /// Fetching All Transactions from SwiftData
    //            if let transactions = try? context.fetch(.init(sortBy: [
    //                SortDescriptor(\Transaction.dateAdded, order: .reverse)
    //            ])) {
    //                /// Step 2:
    //                /// Converting Items to JSON String File
    //                let jsonData = try JSONEncoder().encode(transactions)
    //                if let jsonString = String(data: jsonData, encoding: .utf8) {
    //                    /// Saving into Temporary Document And Sharing it Via ShareSheet
    //                    let tempURL = URL(filePath: NSTemporaryDirectory())
    //                    let pathURL = tempURL.appending(component: "My Expenses\(Date().formatted(date: .complete, time: .omitted)).json")
    //                    try jsonString.write(to: pathURL, atomically: true, encoding: .utf8)
    //                    /// Saved Successfully
    //                    await MainActor.run {
    //                        shareURL = pathURL
    //                        presentShareSheet.toggle()
    //                        isLoading = false
    //                    }
    //                }
    //            } else {
    //                await MainActor.run {
    //                    isLoading = false
    //                    alertMessage = "Error on Exporting"
    //                    showAlert.toggle()
    //                }
    //            }
    //        }
    //    }
    //    
    //    func deleteTempFile() {
    //        do {
    //            try FileManager.default.removeItem(at: shareURL)
    //            print("Removed Temp JSON File")
    //        } catch {
    //            displayAlert(error)
    //        }
    //    }
    //    
    //    /// Displays alert from background thread
    //    func displayAlert(_ error: Error) {
    //        DispatchQueue.main.async {
    //            alertMessage = error.localizedDescription
    //            showAlert.toggle()
    //            isLoading = false
    //        }
    //    }
}
#Preview{
    SideMenu(showMenu: .constant(false))
}

// Extenting View to get SCreen Rect...
extension View{
    func getRect()->CGRect{
        return UIScreen.main.bounds
    }
}

