import SwiftUI

struct ChapterItem: Identifiable {
    var name: String
    var id: Int
}

struct MainView: View {
    @State var columnVisibility = NavigationSplitViewVisibility.doubleColumn
    let chapters: [ChapterItem] = [ChapterItem( name: "Chapter 1: An Introduction to Cellular Automata", id:0),ChapterItem(name: "Chapter 2: 1D Cellular Automata", id: 1),ChapterItem(name: "Chapter 2.5: Elementary Cellular Automata Explorer",id:2)]
    @State private var selectedChapterID: ChapterItem.ID? = 0
    
    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility){
            Text("LivelyCells")
            List(chapters, selection: $selectedChapterID){ chapter in
                Text(chapter.name)
            }
        } detail: {
            VStack{
                switch selectedChapterID {
                case 0:
                    Chapter1()
                case 1:
                    Chapter2()
                case 2:
                    Chapter25()
                default:
                    Chapter1()
                }
                Button(action: {
                    selectedChapterID! += 1
                }, label: {
                    Text("Next Chapter")
                })
            }
        }
    }
}
