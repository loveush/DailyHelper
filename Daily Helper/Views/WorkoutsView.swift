import SwiftUI

struct WorkoutsView: View {
    @State private var date = Date.now
    
    let daysOfWeek = ["M", "T", "W", "T", "F", "S", "S"]
    let columns = Array(repeating: GridItem(.flexible()), count: 7)
    
    @State private var days: [Date] = []
    var body: some View {
        ZStack {
            Color("pink")
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Spacer()
                    Text("Workouts")
                        .font(.title)
                        .foregroundStyle(Color("text"))
                    
                    DatePicker("", selection: $date, displayedComponents: .date)
                        .labelsHidden()
                }
                .offset(y:10)
                .padding(.horizontal, 20)
                
                VStack {
                    HStack {
                        ForEach(daysOfWeek, id: \.self) { dayOfWeek in
                            Text(dayOfWeek)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color("text"))
                                .frame(maxWidth: .infinity)
                                .opacity(0.6)
                        }
                    }
                    
                    Divider()
                        .frame(minHeight: 1)
                        .background(Color("pink"))

                    LazyVGrid(columns: columns) {
                        ForEach(days, id: \.self) { day in
                            if day.monthInt != date.monthInt {
                                Text("")
                            } else {
                                Text(day.formatted(.dateTime.day()))
                                    .foregroundStyle(Color("text"))
                                    .frame(maxWidth: .infinity, minHeight: 35)
                            }
                        }
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color("darkpink"))
                )
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                Spacer()
            }
            .onAppear() {
                days = date.calendarDisplayDays
            }
            .onChange(of: date) {
                days = date.calendarDisplayDays
            }
        }
    }
}

#Preview {
    WorkoutsView()
}
