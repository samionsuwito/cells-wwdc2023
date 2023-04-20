import SwiftUI

struct ChapterItem: Identifiable {
    var name: String
    var id: Int
}

struct MainView: View {
    @State var columnVisibility = NavigationSplitViewVisibility.doubleColumn
    let chapters: [ChapterItem] = [ChapterItem( name: "Chapter 1: An Introduction to Cellular Automata", id:0),ChapterItem(name: "Chapter 2: 1D Cellular Automata", id: 1),ChapterItem(name: "Chapter 2.5: Elementary Cellular Automata Explorer",id:2),ChapterItem(name: "Chapter 3: 2D Cellular Automata", id: 3),ChapterItem(name: "Chapter 3.5: Conway's Game of Life", id: 4),ChapterItem(name: "Chapter 4: Conclusion", id: 5)]
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
                case 3:
                    Chapter3()
                case 4:
                    Chapter35()
                case 5:
                    Chapter4()
                default:
                    Chapter1()
                }
            }
        }
    }
}
