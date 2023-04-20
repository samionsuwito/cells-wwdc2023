import SwiftUI
import SpriteKit

struct Chapter1 : View {
    @State var reloaded = true
    @State var started = false
    
    var golScene = ExampleGOL()
    
    var scene: SKScene {
        let scene = golScene
        scene.size = CGSize(width: 390, height: 390)
        scene.scaleMode = .fill
        return scene
    }
    
    var body: some View {
        VStack {
            Text("Chapter 1")
                .font(.largeTitle)
                .bold()
            
            Text("An introduction to Cellular Automata")
                .font(.headline)
                .foregroundColor(.gray)
            
            Rectangle()
                .cornerRadius(10)
                .foregroundColor(.accentColor)
                .frame(height: 2)
                .padding(.bottom, 15)
                .padding(.horizontal, 20)
            ScrollView{
                VStack(alignment: .leading, spacing: 20) {
                    Text("""
***Make sure to click all the green "Start Simulation" buttons***

Cellular Automata is a field that combines Mathematics and Computer Science that studies how ***"cells"*** behave within a given set of rules in a closed environment. 
 
 Cellular Automata can create many cool patterns that emerge from a simple set of cells. Additionally, Cellular Automata can be used as a model for real-life applications such as forest fires and cave generation.
""")
                    .font(.body)
                    
                    if reloaded{
                        HStack{
                            Spacer()
                            if started{
                                VStack{
                                    SpriteView(scene: scene)
                                        .frame(width: 390, height: 390)  
                                    HStack{
                                        Spacer()
                                        Button(action: {
                                            golScene.reset()
                                        }, label: {
                                            HStack{
                                                Image(systemName: "gobackward")
                                                Text("Reset") 
                                            }
                                        })
                                        .buttonStyle(.borderedProminent)
                                        Spacer()
                                    }
                                }  
                            } else{
                                Button(action: {
                                    started = true
                                }, label: {
                                    Text("Start Simulation \n Click Here")
                                        .frame(width: 390, height: 390)
                                        .font(.title)
                                        .bold() 
                                })
                                .buttonStyle(.borderedProminent)
                            }
                            Spacer()
                        }
                    }
                    
                    HStack{
                        Rectangle()
                            .cornerRadius(10)
                            .foregroundColor(.secondary)
                            .frame(width: 3,height:.infinity)
                        Text("The simulation above is of Conway's Game of Life, the most famous cellular automation. It was created by mathematician John Horton Conway in 1970. This simulation starts off at a random state and follows a certain set of rules. Conway's Game of Life will be further discussed in Chapter 3.")
                            .padding(10)
                    }
                    .background(.quaternary)
                    .cornerRadius(4)
                    Rectangle()
                        .cornerRadius(10)
                        .foregroundColor(.secondary)
                        .frame(height: 2)
                    
                    //                    Cells Section
                    Text("Cells")
                        .font(.title)
                        .bold()
                        .frame(maxWidth:.infinity,alignment: .center)                  
                    Text("""
Cells are the building blocks of Cellular Automata, so what exactly are they?

Each cell typically has a state associated with them. In the simulation above, the cell is a square that can either be filled or unfilled. That's referred to usually as ***on*** and ***off***. However, since this is in the context of the Game of ***Life***, we call the state that's on as live and the one that's off as dead. Cells can also have more than two states. Cellular Automation are typically made up of grids of cells so we refer the ones next to them as ***neighbours***.
""")
                    Rectangle()
                        .cornerRadius(10)
                        .foregroundColor(.secondary)
                        .frame(height: 2)
//                    Rules
                    Text("Rules")
                        .font(.title)
                        .bold()
                        .frame(maxWidth:.infinity,alignment: .center)
                Text("""
Each Cellular Automata typically follows a set of rules. 
                         
In the Game of Life, each cell checks its neighbours (the 8 cells around, hoizontally, vertically and diagonally adjacent) and counts how many of them are live. It then follows the following rules:
 
• If the cell is live and has **fewer than two** live neighbours, it dies by underpopulation.
• If the cell is live and has **two or three** live neighbours, it lives.
• If the cell is live and has **more than three** live neighbours, it dies by overpopulation.
• If the cell is dead and has **exactly three** live neighbours, it becomes live by reproduction.
 
These rules make up the entire simulation of the Game Of Life and creates the interesting patterns you see above.
""")
                    
                    
                }
                .padding(.horizontal, 20)
            }
        }
    }
}

class ExampleGOL: SKScene {
        var cellSize: Int = 20
        var cellStates: [[Bool]] = [] 
        var cells: [[SKShapeNode]] = []
        var interval = 0
        var framesPerUpdate = 20
        var strokeWidth: Int = 3
        var loaded = false
        var cellWidth = 18
        var cellHeight = 18
    
        func reset() {
            var newCellStates: [[Bool]] = []
            for i in 0...cellWidth {
                var newCellRow: [Bool] = []
                for j in 0...cellHeight { 
                    if Bool.random() {
                        newCellRow.append(false)
                    } else { 
                        newCellRow.append(true)
                    }
                }
                newCellStates.append(newCellRow)
            }
            cellStates = newCellStates
            for i in 0...cellWidth {
                for j in 0...cellHeight {
                    if cellStates[i][j]{
                        cells[i][j].fillColor = .black
                    } else {
                        cells[i][j].fillColor = .white
                    }
                }
            }
        }    
    
        override func didMove(to view: SKView) {
            self.backgroundColor = .white
            for i in 0...cellWidth{
                var cellStateRow: [Bool] = []
                var cellRow: [SKShapeNode] = []
                for j in 0...cellHeight {
                    let cell = SKShapeNode(rect: CGRect(x: 3 + cellSize*j, y: 3 + cellSize*i, width: cellSize, height: cellSize))
                    cell.strokeColor = .black
                    cell.lineWidth = CGFloat(strokeWidth)
                    if Bool.random(){
                        //                        cell.fillColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
                        cell.fillColor = .white
                        cellStateRow.append(false)
                    } else {
                        //                    cell.fillColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
                        cell.fillColor = .black
                        cellStateRow.append(true)
                    }
                    cellRow.append(cell)
                    addChild(cell)
                }
                cells.append(cellRow)
                cellStates.append(cellStateRow)
            }
            loaded = true
        }
        
        override func update(_ currentTime: TimeInterval) {
                   
            //        make sure that didMove finishes running first
            if loaded {
                if interval == (framesPerUpdate - 1) {
                    var newCellStates: [[Bool]] = []
                    for i in 0...cellWidth {
                        var newCellRow: [Bool] = []
                        for j in 0...cellHeight {
                            let neighbours = calculateNeighbours(x: i, y: j)
                            if cellStates[i][j] && !(neighbours == 2 || neighbours == 3)  {
                                newCellRow.append(false)
                            } else if !cellStates[i][j] && neighbours == 3 {
                                newCellRow.append(true)
                            } else {
                                newCellRow.append(cellStates[i][j])
                            }
                        }
                        newCellStates.append(newCellRow)
                    }
                    cellStates = newCellStates
                    for i in 0...cellWidth {
                        for j in 0...cellHeight {
                            if cellStates[i][j]{
                                cells[i][j].fillColor = .black
                            } else {
                                cells[i][j].fillColor = .white
                            }
                        }
                    }
                    interval = 0
                }
                interval += 1
            }
        }
        
        func calculateNeighbours(x:Int, y:Int) -> Int {
            var neighbours = 0
            let neighbourList = [[-1,-1],[-1,0],[-1,1],[0,-1],[0,1],[1,-1],[1,0],[1,1]]
            for entry in neighbourList{
                var neighbourX = x + entry[0]
                var neighbourY = y + entry[1]
                switch neighbourX {
                case -1:
                    neighbourX = cellWidth
                case cellWidth + 1:
                    neighbourX = 0
                default:
                    break
                }
                
                switch neighbourY {
                case -1:
                    neighbourY = cellHeight
                case cellHeight + 1:
                    neighbourY = 0
                default:
                    break
                }
                if cellStates[neighbourX][neighbourY]{
                    neighbours += 1
                }
            }
            return neighbours
        }
}

struct Chapter1_Previews: PreviewProvider {
    static var previews: some View {
        Chapter1()
    }
}
