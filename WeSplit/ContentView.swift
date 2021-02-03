import SwiftUI

struct ContentView: View {
	@State private var checkAmount = ""
	@State private var numberOfPeople = 2
	@State private var tipPercentage = 2
	
	let tipPercentages = [10, 15, 20, 25, 0]
	
	var totalPerPerson: Double {
		// Calculate the total of person
		let peopleCount = Double(numberOfPeople + 2)
		let tipSelection = Double(tipPercentages[tipPercentage])
		
		// check apa save ga dari String ke double
		// klo error, pake 0
		let orderAmount = Double(checkAmount) ?? 0
		let tipValue = orderAmount / 100 * tipSelection
		let grandTotal = orderAmount + tipValue
		let amountPerPerson = grandTotal / peopleCount
		
		return amountPerPerson
	}
		
	var body: some View {
		NavigationView {
			Form {
				Section {
					TextField("Amount", text: self.$checkAmount)
						.keyboardType(.decimalPad)
					Picker("Number of people", selection: $numberOfPeople){
						ForEach(2..<100){
							Text("\($0) people")
						}
					}
				}
				
				Section(header: Text("How much tip do you to leave?")){
					Picker("Tip percentage", selection: $tipPercentage){
						ForEach(0..<self.tipPercentages.count){
							Text("\(self.tipPercentages[$0])%")
						}
					}
				.pickerStyle(SegmentedPickerStyle())
				}
				Section {
					Text("$\(totalPerPerson, specifier: "%.2f")")
				}
			}
		.navigationBarTitle("WeSplit")
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
