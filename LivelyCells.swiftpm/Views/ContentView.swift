import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    @State var chapter = 0
    @State var expanded = true
    
    var body: some View {
        MenuView()
    }
}
