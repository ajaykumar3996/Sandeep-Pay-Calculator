//
//  ContentView.swift
//  SandeepPay
//
//  Created by Ajaykumar on 9/19/22.
//

import SwiftUI

struct ContentView: View {
    @State private var numOfHours: String = ""
    @State private var showDetails = false
    @State private var username: String = ""
    @State var isMonthly: Bool = true
    var body: some View {
        
        NavigationView{
            VStack {
                Spacer()
                Spacer()
                Text("Sandeep Pay Calculator").bold()
                    .font(.system(.title, design: .rounded))
                Spacer()
                input
                Spacer()
            }
        }
        
}
}

private extension ContentView{
    var result:some View{
        Section{
            Form{
                let numOfHoursConv = Double(numOfHours)
                let employerPercentage = 0.8
                let cashPercentage = 0.75
                let payRate = Double(54)
                let totalPayRounded = (numOfHoursConv ?? 0 )*employerPercentage*cashPercentage*payRate
                let ajaysPart = isMonthly ? 1000.00 : 500.00
                let sandeepsPay = String(format: "%.2f", totalPayRounded - ajaysPart)
                
                let totalPayPrint = String(format: "%.2f",totalPayRounded)
                Text("Total Pay : \(totalPayPrint)")
                
                let ajaysPartPrint = String(format: "%.2f",ajaysPart)
                Text("Ajay's Part : \(ajaysPartPrint)")
                
                Text("Sandeep's Pay : \(sandeepsPay)")
            }
                
        }
    }
    
}

private extension ContentView{
    
    var input : some View{
        
        Section{
            VStack{
                HStack{
                    Text("Number Of Hours")
                        .padding([.top, .leading, .bottom], 41.0)
                        TextField(
                            "Required",
                            text: $numOfHours
                        ).keyboardType(UIKeyboardType.numberPad).padding([.top, .leading, .bottom], 33.0)

                }
                Toggle(isOn: $isMonthly) {
                    Text("Monthly Hours")
                        .padding(.all, 37.0)
                    }
                Button(action:{
                    showDetails = true
                    })
                       {
                           Text("Calculate")
                               .padding()
                                   .foregroundColor(.white)
                                   .background(Color.blue)
                                   .cornerRadius(40)
                       }
                       .padding([.top, .leading, .trailing])
                NavigationLink("", destination:  result, isActive: $showDetails)
            }
            
            
//            let selectedPayCycle : payCycle
//            Picker("Pay Cycle",selection: $contentView.)
//            {
//                ForEach(ContentView.payCycle.allCases)
//                {
//                    item in Text(item.rawValue)
//                }
//            }.pickerStyle(.wheel)
            

            
//            if showDetails{
//                result
//            }
        }
//    header:{
//            Text("Enter Number of Hours")
//            }.headerProminence(.increased)
    }
}

//Yet to be implemented for picker of pay cyle
extension ContentView{
    enum PayCycle : String , Identifiable, CaseIterable{
        var id : Self {self}
        case SemiMonthly = "Semi Monthly"
        case Monthly
    }
}

//Yet to be implemented for picker of pay cyle
extension ContentView{
    struct PayCycleStructure{
        var payCycle : PayCycle
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
        
    }
};

