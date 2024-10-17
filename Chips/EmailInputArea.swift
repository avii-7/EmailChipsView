////
////  EmailInputArea.swift
////  Chips
////
////  Created by Arun Kumar on 01/10/24.
////
//
//import SwiftUI
//
//struct EmailIdInputArea: View {
//    
//    private enum ContentType {
//        case chip, textfield
//    }
//    
//    @State var emailInput: String = ""
//    let screenWidth = UIScreen.main.bounds.width
//    @State private var hStackWidth: CGFloat = 0
//    @State private var textfieldsize: CGFloat = 0
//    @State var cureentRowIndex:Int=0
//    @FocusState private var isTextFieldFocused: Bool
//    
//    @State private var hitEnter: Bool = false
//    
//    private static let textField = "INPUT_FIELD"
//    
//    @State private var emailListRows: [[String]] = [
//        [textField]
//    ]
//    
//    @Binding var emails: [String]
//    
//    let hStackColor = Color.yellow
//    let textFieldColor = Color.cyan
//    
//    init(emails: Binding<[String]>) {
//        _emails = emails
//    }
//    
//    var body: some View {
//        VStack(alignment: .leading, spacing: 0) {
//            ForEach(emailListRows, id: \.self) { row in
//                HStack(alignment: .center, spacing: 4) {
//                    ForEach(row, id: \.self) { emailId in
//                        if(emailId == Self.textField) {
//                            createTextField()
//                        }
//                        else {
//                            EmailChipCard(email: emailId) { item in
//                                
//                            }
//                                .layoutPriority(1)
//                        }
//                    }
//                }
//                .frame(maxWidth: screenWidth)
//                .fixedSize()
//                .padding(0)
//                .background(
//                    GeometryReader { geometry in
//                        hStackColor
//                            .onAppear {
//                                // Get the width of the HStack when it appears
//                                hStackWidth = geometry.size.width
//                                //updateRows()
//                            }
//                    }
//                )
//            }
//        }
//        .frame(maxWidth: .infinity, alignment: .leading)
//        .background(Color.red)
//    }
//    @State var moved = false
//    private func createTextField() -> some View {
//        
//        
//        
//        return ScrollView(.horizontal) {
//            TextField("enter email", text: $emailInput, axis: .horizontal)
//                .textFieldStyle(.plain)
//                .lineLimit(1)
//                .padding(4)
//                .padding(.trailing, 55)
//                .focused($isTextFieldFocused)
//                .textInputAutocapitalization(.never)
//                .onSubmit {
//                    //addnewitem(item: emailInput)
//                    addnewitem2(item: emailInput)
//                    emailInput = ""
//                    isTextFieldFocused = true
//                    hitEnter = true
//                }
//                .background(
//                    GeometryReader { geometry in
//                        textFieldColor
//                            .onAppear {
//                                textfieldsize = geometry.size.width
//                                moveTextFieldToNextRowIfRequired(textFieldWidth: geometry.size.width)
//                            }
//                    }
//                )
//        }
//        .onScrollGeometryChange(for: [Double].self) { scrollGeometry in
//            [
//                scrollGeometry.contentSize.width,
//                scrollGeometry.containerSize.width
//            ]
//            
//        } action: { oldValue, newValue in
//            if moved == false, newValue[0] > newValue[1] {
//                //print("move to new line")
//                moved = true
//                print("shinfing")
//                let textField = emailListRows[emailListRows.count - 1].removeLast()
//                
//                emailListRows.append([textField])
//                lastTextFieldFitWidth = newValue[1]
//                
//            }
//            else if hitEnter == false, moved, lastTextFieldFitWidth >= newValue[1] {
//                
//               // emailListRows[emailListRows.count - 2].append(Self.textField)
//                //                    print("shifted upward")
//                let textField = emailListRows.removeLast()
//                
//                //let textFieldRow = emailListRows.removeLast()
//                
////                print("Row remains: \(emailListRows.count)")
////                
//                if let textField = textField.first {
//                emailListRows[emailListRows.count - 1].append(textField)
//                    print("shifted upward")
//                }
////                
//                moved = false
//            }
//            print(moved, lastTextFieldFitWidth, newValue[1], "rows: \(emailListRows.count)")
////            else if oldValue[0] > newValue[0] && newValue[0] < newValue[1] {
////                let textFieldRow = emailListRows.removeLast()
////                
////                if let textField = textFieldRow.first {
////                    emailListRows[emailListRows.count - 1].append(textField)
////                    print("you game 1")
////                }
////                print("you game 2")
////                
////                //emailListRows.append([textField])
////                
////            }
//            print(newValue)
//            
//        }
//    }
//    
//    @State private var lastTextFieldFitWidth = 0.0
//    
//    private func moveTextFieldToNextRowIfRequired(textFieldWidth: Double) {
//       //print("H: \(hStackWidth) +T: \(textFieldWidth)", "Screen width: \(screenWidth)", terminator: " ")
//        
//        if hStackWidth + textFieldWidth > screenWidth {
//            //print("New line")
//           // let textField = emailListRows[emailListRows.count - 1].removeLast()
//           // emailListRows.append([textField])
//            print("Some thing wrong")
//        }
//        else {
//            //print("Not greater text field")
//        }
//    }
//    
//    private func addnewitem(item:String)
//    {
//        //print("Added new item.", "cureentRowIndex: \(cureentRowIndex)", "Email list rows: \(emailListRows.count)", separator: "\n")
//        emailListRows[cureentRowIndex].insert(item, at: emailListRows[cureentRowIndex].count-1)
//    }
//    
//    private func addnewitem2(item: String)
//    {
//        let size = emailInput.size(withAttributes: [.font: UIFont.preferredFont(forTextStyle: .body)])
//        print(emailListRows)
//        // Item should be add where the textfield currently in
//        emailListRows[emailListRows.count - 1].insert(item, at: emailListRows[emailListRows.count - 1].count - 1)
//        
//        if (hStackWidth + size.width > screenWidth) {
//            //print("new line")
//        }
//        else {
//            //print("same line")
//        }
//        print(emailListRows)
//        
//        //emailListRows[cureentRowIndex].insert(item, at: emailListRows[cureentRowIndex].count-1)
//    }
//    
//    
//    private func updateRows()
//    {
//        if(hStackWidth > (screenWidth))
//        {
//           // print("EXECUTION 1")
//            if screenWidth < hStackWidth-textfieldsize
//            {
//                //move 2 items to next line
//                let newitem:String = emailListRows[cureentRowIndex].last!
//                emailListRows[cureentRowIndex].removeLast()
//                let newitem1:String = emailListRows[cureentRowIndex].last!
//                emailListRows[cureentRowIndex].removeLast()
//                let newRow=[newitem1,newitem]
//                emailListRows.append(newRow)
//                cureentRowIndex = cureentRowIndex+1
//                //print("old row")
//            }
//            else{
//                //Move 1 item to next row
//                let newitem:String = emailListRows[cureentRowIndex].last!
//                emailListRows[cureentRowIndex].removeLast()
//                let newRow=[newitem]
//                emailListRows.append(newRow)
//                cureentRowIndex = cureentRowIndex+1
//                //print("new row")
//            }
//        }
//        else {
//            print("NO EXECUTION")
//        }
//    }
//    
//    private func createRows(items: [String]) -> [[String]] {
//        var rows: [[String]] = []
//        var currentRow: [String] = []
//        
//        for item in items {
//            currentRow.append(item)
//            
//            // Example condition: 2 items per row
//            if currentRow.count == 2 {
//                rows.append(currentRow)
//                currentRow = []
//            }
//            
//        }
//        
//        // Append remaining items (if any) to the last row
//        if !currentRow.isEmpty {
//            rows.append(currentRow)
//        }
//        
//        return rows
//    }
//}
//
//#Preview {
//    EmailIdInputArea(emails: .constant([""]))
//        .padding(.horizontal)
//}
//
//
