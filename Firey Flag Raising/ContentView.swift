import SwiftUI

struct ContentView: View {
    
    @ObservedObject var flagDataManager = FlagDataManager()
    
    var body: some View {
        TabView {
            FlagRaisingView(flagOffset: $flagDataManager.flagOffset, flag: $flagDataManager.flag)
                .tabItem {
                    Label("Flag Raising", systemImage: "arrow.up")
                }
            FlagSelectorView(selectedFlag: $flagDataManager.flag)
                .tabItem {
                    Label("Flag Selector", systemImage: "flag.badge.ellipsis")
                }
        }
        .onChange(of: flagDataManager.flag, perform: { value in
            flagDataManager.saveFlag()
        })
        .onChange(of: flagDataManager.flagOffset, perform: { value in
            flagDataManager.saveFlagOffset()
        })
        .onAppear {
            flagDataManager.setupDataObserver()
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
