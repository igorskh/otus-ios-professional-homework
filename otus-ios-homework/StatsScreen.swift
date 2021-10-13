//
//  StatsScreen.swift
//  otus-ios-homework
//
//  Created by Igor Kim on 13.10.21.
//

import SwiftUI

struct StatsScreen: View {
    @EnvironmentObject var suffixCounter: SuffixCounterService
    
    var body: some View {
        VStack {
            Picker("Type", selection: $suffixCounter.listType) {
                Text("Alphabetic")
                    .tag(ListType.alphabetic)
                Text("Top")
                    .tag(ListType.top)
            }
            .pickerStyle(.segmented)
            
            Picker("Direction", selection: $suffixCounter.sortDirection) {
                Text("ASC")
                    .tag(SortDirection.asc)
                Text("DESC")
                    .tag(SortDirection.desc)
            }
            .pickerStyle(.segmented)
            
            List {
                ForEach(suffixCounter.suffixSorted, id: \.self) { suffix in
                    HStack {
                        Text(suffix)
                        Spacer()
                        Text("\(suffixCounter.suffixCounts[suffix] ?? 0)")
                    }
                }
            }
        }
    }
}

struct StatsScreen_Previews: PreviewProvider {
    static var previews: some View {
        StatsScreen()
    }
}
