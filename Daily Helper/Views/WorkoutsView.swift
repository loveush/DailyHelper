import SwiftUI

struct WorkoutsView: View {
    
    let daysOfWeek = ["M", "T", "W", "T", "F", "S", "S"]
    let columns = Array(repeating: GridItem(.flexible()), count: 7)
    @State private var days: [Date] = []
    
    private let userId: String
    init(userId: String) {
        self.userId = userId
    }
    
    @StateObject var viewModel = WorkoutsViewViewModel()
    var body: some View {
        NavigationStack {
            ZStack {
                Color("pink")
                    .ignoresSafeArea()
                
                VStack {
                    // Header
                    HStack {
                        Spacer()
                        Text("Workouts")
                            .font(.title)
                            .foregroundStyle(Color("text"))
                        
                        DatePicker("", selection: $viewModel.date, displayedComponents: .date)
                            .labelsHidden()
                    }
                    .offset(y:10)
                    .padding(.horizontal, 20)
                    
                    // Calendar view
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
                                if day.monthInt != viewModel.date.monthInt {
                                    Text("")
                                } else {
                                    Text(day.formatted(.dateTime.day()))
                                        .font(.system(size:18))
                                        .foregroundStyle(Color("text"))
                                        .frame(maxWidth: .infinity, minHeight: 35)
                                        .background(
                                            day.startOfDay == Date.now.startOfDay ?
                                            Circle()
                                                .fill(Color("pink"))
                                                .frame(width: 40, height: 40)
                                                .opacity(0.6)
                                                .shadow(radius: 2, y:2) : nil
                                        )
                                        .background(
                                            viewModel.date == day ?
                                            Circle()
                                                .fill(Color("pink"))
                                                .frame(width: 40, height: 40)
                                                .opacity(0.4): nil
                                        )
                                        .overlay(alignment: .top) {
                                            if viewModel.counts[day.dayInt] != nil {
                                                Circle()
                                                    .fill(Color.white)
                                                    .frame(width: 8, height: 8)
                                            }
                                            
                                        }
                                        .onTapGesture {
                                            viewModel.date = day
                                        }
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
                    
                    HStack {
                        Text("Plan for the day:")
                            .font(.title3)
                            .foregroundStyle(Color("text"))
                        
                        Spacer()
                        
                        // Add workout
                        Image(systemName: "plus")
                            .resizable()
                            .foregroundStyle(Color("darkpink"))
                            .frame(width: 20, height: 20)
                    }
                    .padding(.horizontal, 30)
                    .padding(.top, 5)
                    
                    // Workouts list
                    if viewModel.counts[viewModel.date.dayInt] != nil {
                        ScrollView {
                            VStack () {
                                ForEach(viewModel.currentWorkouts) { workout in
                                    WorkoutItemView(workout: workout)
                                }
                            }
                        }
                    } else {
                        Spacer()
                        
                        Text("Add a workout")
                            .font(.largeTitle)
                            .foregroundStyle(Color("darkpink"))
                            .opacity(0.5)
                        Image(systemName: "plus.viewfinder")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundStyle(Color("darkpink"))
                            .opacity(0.5)
                        
                        Spacer()
                    }
                    
                }
                .onAppear() {
                    days = viewModel.date.calendarDisplayDays
                    viewModel.exampleWorkouts()
                    viewModel.setupCounts()
                    viewModel.setCurrentWorkouts()
                }
                .onChange(of: viewModel.date) {
                    days = viewModel.date.calendarDisplayDays
                    viewModel.setupCounts()
                    viewModel.setCurrentWorkouts()
                }
            }
        }
    }
}

#Preview {
    WorkoutsView(userId: "")
}
