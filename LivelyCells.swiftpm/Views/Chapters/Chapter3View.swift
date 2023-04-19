import SwiftUI
import SpriteKit

struct Chapter3: View {
    @State var started = [false,false,false,false]
    
    var body: some View{
        VStack{
            Text("Chapter 3")
                .font(.largeTitle)
                .bold()
            
            Text("2D Cellular Automata")
                .font(.headline)
                .foregroundColor(.gray)
            
            Rectangle()
                .cornerRadius(10)
                .foregroundColor(.accentColor)
                .frame(height: 2)
                .padding(.bottom, 15)
                .padding(.horizontal, 20)
            ScrollView{
                VStack(alignment: .leading,spacing: 20) {
                    Group{
                        Text("""
Similarly, 2D Cellular Automata can create interesting patterns. I will mainly focus on Conway's **Game Of Life (GOL)** but also look at the cool applications of 2D Cellular Automata.
""")
                        Rectangle()
                            .cornerRadius(10)
                            .foregroundColor(.secondary)
                            .frame(height: 2)
                        Text("Patterns in the GOL")
                            .font(.title)
                            .frame(maxWidth:.infinity,alignment: .center)   
                        Text("""
Inside Conway's Game of Life, there are many super cool patterns you can notice. These patterns are defined by the behaviour they exhibit.

The following patterns are considered ***still life***. These means they do not change at all and stay stable.
""")
                    }
                    HStack{
                        Spacer()
                        if started[0]{
                            SpriteView(scene: scene0,preferredFramesPerSecond: 1)
                                .frame(width: 390, height: 390)    
                        } else{
                            Button(action: {
                                for i in 0..<started.count{
                                    started[i] = false
                                    if i == 0 {
                                        started[i] = true
                                    }
                                }
                            }, label: {
                                Text("Start Simulation")
                                    .frame(width: 390, height: 390)
                                    .font(.title)
                                    .bold() 
                            })
                            .buttonStyle(.borderedProminent)
                        }
                        Spacer()
                    }
                    
                    HStack{
                        Rectangle()
                            .cornerRadius(10)
                            .foregroundColor(.secondary)
                            .frame(width: 3,height:.infinity)
                        Text("Fun fact! Some of these still lifes were actually found without computers and instead on objects like Go boards and graph paper.")
                            .padding(10)
                    }
                    .background(.quaternary)
                    .cornerRadius(4)
                    Text("These following patterns are called ***oscillators*** as they loop forever.")
                    HStack{
                        Spacer()
                        if started[1]{
                            SpriteView(scene: scene1)
                                .frame(width: 390, height: 390)    
                        } else{
                            Button(action: {
                                for i in 0..<started.count{
                                    started[i] = false
                                    if i == 1 {
                                        started[i] = true
                                    }
                                }
                            }, label: {
                                Text("Start Simulation")
                                    .frame(width: 390, height: 390)
                                    .font(.title)
                                    .bold() 
                            })
                            .buttonStyle(.borderedProminent)
                        }
                        Spacer()
                    }
                    Text("These following patterns are called ***spaceships*** as they can move through the simulation without dying.")
                    HStack{
                        Spacer()
                        if started[2]{
                            SpriteView(scene: scene2)
                                .frame(width: 390, height: 390)  
                            SpriteView(scene: scene3)
                                .frame(width: 390, height: 390)   
                        } else{
                            Button(action: {
                                for i in 0..<started.count{
                                    started[i] = false
                                    if i == 2 {
                                        started[i] = true
                                    }
                                }
                            }, label: {
                                Text("Start Simulation")
                                    .frame(width: 390, height: 390)
                                    .font(.title)
                                    .bold() 
                            })
                            .buttonStyle(.borderedProminent)
                        }
                        Spacer()
                    }
                    Text("These following pattern is called a ***seed*** as they are able to generate for long periods of time")
                    HStack{
                        Spacer()
                        if started[3]{
                            VStack{
                                SpriteView(scene: scene4)
                                    .frame(width: 400, height: 400)
                                HStack{
                                    Button(action: {
                                        seedScene.reset()
                                        seedScene.onCell(x:20,y:20)
                                        seedScene.onCell(x:20,y:21)
                                        seedScene.onCell(x:20,y:22)
                                        seedScene.onCell(x:21,y:19)
                                        seedScene.onCell(x:22,y:17)
                                        seedScene.onCell(x:20,y:17)
                                        seedScene.onCell(x:20,y:16)
                                    }, label: {
                                        Text("Reset")
                                    })
                                    .buttonStyle(.borderedProminent)
                                }
                            }
                        } else{
                            Button(action: {
                                for i in 0..<started.count{
                                    started[i] = false
                                    if i == 3 {
                                        started[i] = true
                                    }
                                }
                            }, label: {
                                Text("Start Simulation")
                                    .frame(width: 400, height: 400)
                                    .font(.title)
                                    .bold() 
                            })
                            .buttonStyle(.borderedProminent)
                        }
                        Spacer()
                    }
                    Text("There are of course even more patterns you can explore than the ones I've shown here including ***guns***, ***rakes*** and ***puffers***. They all exhibit their own unique behaviours contributing to how cool Conway's Game of Life is")
//                    
                }
            }
            .padding(.horizontal, 20)
        }
    }
    
    @State var seedScene = LargeGameOfLife()
    
    var scene4: SKScene {
        let scene = seedScene
        scene.size = CGSize(width: 390, height: 390)
        scene.scaleMode = .fill
        scene.start()
        scene.onCell(x:20,y:20)
        scene.onCell(x:20,y:21)
        scene.onCell(x:20,y:22)
        scene.onCell(x:21,y:19)
        scene.onCell(x:22,y:17)
        scene.onCell(x:20,y:17)
        scene.onCell(x:20,y:16)
        return scene
    }
    
    var scene3: SKScene {
        let scene = GameOfLife()
        scene.size = CGSize(width: 390, height: 390)
        scene.scaleMode = .fill
        scene.start()
//        lgihtweight
        scene.onCell(x: 10, y: 8)
        scene.onCell(x: 10, y: 9)
        scene.onCell(x: 9, y: 6)
        scene.onCell(x: 9, y: 7)
        scene.onCell(x: 9, y: 9)
        scene.onCell(x: 9, y: 10)
        scene.onCell(x: 8, y: 6)
        scene.onCell(x: 8, y: 7)
        scene.onCell(x: 8, y: 8)
        scene.onCell(x: 8, y: 9)
        scene.onCell(x: 7, y: 7)
        scene.onCell(x: 7, y: 8)
        return scene
    }
    
    var scene2: SKScene {
        let scene = GameOfLife()
        scene.size = CGSize(width: 390, height: 390)
        scene.scaleMode = .fill
        scene.start()
//        glider
        scene.onCell(x:17,y:2)
        scene.onCell(x:16,y:3)
        scene.onCell(x:15,y:1)
        scene.onCell(x:15,y:2)
        scene.onCell(x:15,y:3)
        return scene
    }
    
    var scene1: SKScene {
        let scene = GameOfLife()
        scene.size = CGSize(width: 390, height: 390)
        scene.scaleMode = .fill
        scene.start()
        scene.onCell(x: 5, y: 8)
        scene.onCell(x: 5, y: 9)
        scene.onCell(x: 5, y: 10)
        scene.onCell(x: 6, y: 8)
        scene.onCell(x: 6, y: 10)
        scene.onCell(x: 7, y: 8)
        scene.onCell(x: 7, y: 9)
        scene.onCell(x: 7, y: 10)
        scene.onCell(x: 8, y: 8)
        scene.onCell(x: 8, y: 9)
        scene.onCell(x: 8, y: 10)
        scene.onCell(x: 9, y: 8)
        scene.onCell(x: 9, y: 9)
        scene.onCell(x: 9, y: 10)
        scene.onCell(x: 10, y: 8)
        scene.onCell(x: 10, y: 9)
        scene.onCell(x: 10, y: 10)
        scene.onCell(x: 11, y: 8)
        scene.onCell(x: 11, y: 10)
        scene.onCell(x: 12, y: 8)
        scene.onCell(x: 12, y: 9)
        scene.onCell(x: 12, y: 10)
//        beacon
        scene.onCell(x: 1, y: 3)
        scene.onCell(x: 1, y: 4)
        scene.onCell(x: 2, y: 3)
        scene.onCell(x: 2, y: 4)
        scene.onCell(x: 3, y: 1)
        scene.onCell(x: 4, y: 1)
        scene.onCell(x: 3, y: 2)
        scene.onCell(x: 4, y: 2)
//        toad
        scene.onCell(x: 15, y: 1)
        scene.onCell(x: 15, y: 2)
        scene.onCell(x: 15, y: 3)
        scene.onCell(x: 16, y: 4)
        scene.onCell(x: 16, y: 2)
        scene.onCell(x: 16, y: 3)
//        blinker
        scene.onCell(x: 15, y: 15)
        scene.onCell(x: 15, y: 16)
        scene.onCell(x: 15, y: 17)
        return scene
    }
    
    var scene0: SKScene {
        let scene = GameOfLife()
        scene.size = CGSize(width: 390, height: 390)
        scene.scaleMode = .fill
        scene.start()
        //        block
        scene.onCell(x: 1, y:1)
        scene.onCell(x: 1, y:2)
        scene.onCell(x: 2, y:1)
        scene.onCell(x: 2, y:2)
        //        tub
        scene.onCell(x: 13, y:1)
        scene.onCell(x: 14, y:2)
        scene.onCell(x: 12, y:2)
        scene.onCell(x: 13, y:3)
        //        loaf
        scene.onCell(x: 5, y:5)
        scene.onCell(x: 6, y:4)
        scene.onCell(x: 7, y:4)
        scene.onCell(x: 6, y:6)
        scene.onCell(x: 7, y:7)
        scene.onCell(x: 8, y:8)
        scene.onCell(x: 8, y:5)
        scene.onCell(x: 8, y:6)
        scene.onCell(x: 9, y:9)
        scene.onCell(x: 9, y:7)
        scene.onCell(x: 10, y:7)
        scene.onCell(x: 11, y:8)
        scene.onCell(x: 11, y:9)
        scene.onCell(x: 10, y:10)
//        bars
        scene.onCell(x:16,y:13)
        scene.onCell(x:16,y:12)
        scene.onCell(x:15,y:13)
        scene.onCell(x:14,y:13)
        scene.onCell(x:13,y:13)
        scene.onCell(x:13,y:12)
        scene.onCell(x:16,y:15)
        scene.onCell(x:16,y:16)
        scene.onCell(x:15,y:15)
        scene.onCell(x:14,y:15)
        scene.onCell(x:13,y:15)
        scene.onCell(x:13,y:16)
//        eater2
        scene.onCell(x:7,y:11)
        scene.onCell(x:6,y:11)
        scene.onCell(x:7,y:12)
        scene.onCell(x:6,y:12)
        scene.onCell(x:7,y:14)
        scene.onCell(x:6,y:14)
        scene.onCell(x:6,y:15)
        scene.onCell(x:6,y:16)
        scene.onCell(x:5,y:17)
        scene.onCell(x:4,y:16)
        scene.onCell(x:4,y:15)
        scene.onCell(x:4,y:14)
        scene.onCell(x:3,y:14)
        scene.onCell(x:2,y:14)
        scene.onCell(x:1,y:13)
        scene.onCell(x:2,y:12)
        scene.onCell(x:3,y:12)
        scene.onCell(x:4,y:12)
        scene.onCell(x:4,y:11)
        scene.onCell(x:4,y:14)
        scene.onCell(x:7,y:14)
        return scene
    }
    
    
}

class GameOfLife: SKScene {
    var cellSize: Int = 20
    var cellStates: [[Bool]] = [] 
    var cells: [[SKShapeNode]] = []
    var interval = 0
    var framesPerUpdate = 20
    var strokeWidth: CGFloat = 2.5
    var loaded = false
    var normalStart = true
    var cellWidth = 18
    var cellHeight = 18
    
    func reset() {
        var newCellStates: [[Bool]] = []
        for i in 0...cellWidth {
            var newCellRow: [Bool] = []
            for j in 0...cellHeight { 
                newCellRow.append(false)
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
        
    func start(){
        normalStart = false
        self.backgroundColor = .white
        for i in 0...cellWidth{
            var cellStateRow: [Bool] = []
            var cellRow: [SKShapeNode] = []
            for j in 0...cellHeight {
                let cell = SKShapeNode(rect: CGRect(x: 3 + cellSize*j, y: 3 + cellSize*i, width: cellSize, height: cellSize))
                cell.strokeColor = .black
                cell.lineWidth = CGFloat(strokeWidth)
                //                        cell.fillColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
                cell.fillColor = .white
                cellStateRow.append(false)
                cellRow.append(cell)
                addChild(cell)
            }
            cells.append(cellRow)
            cellStates.append(cellStateRow)
        }
    }    
    
        override func didMove(to view: SKView) {
            if normalStart{
                self.backgroundColor = .white
                for i in 0...cellWidth{
                    var cellStateRow: [Bool] = []
                    var cellRow: [SKShapeNode] = []
                    for j in 0...cellHeight {
                        let cell = SKShapeNode(rect: CGRect(x: 3 + cellSize*j, y: 3 + cellSize*i, width: cellSize, height: cellSize))
                        cell.strokeColor = .black
                        cell.lineWidth = CGFloat(strokeWidth)
                        //                        cell.fillColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
                        cell.fillColor = .white
                        cellStateRow.append(false)
                        cellRow.append(cell)
                        addChild(cell)
                    }
                    cells.append(cellRow)
                    cellStates.append(cellStateRow)
                }
            } 
            onSimulation()
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
        
        func onCell(x:Int,y:Int){
            cellStates[x][y] = true
            cells[x][y].fillColor = .black
        }
        
        func onSimulation(){
            loaded = true
        }
}

class LargeGameOfLife: SKScene {
    var cellSize: Int = 9
    var cellStates: [[Bool]] = [] 
    var cells: [[SKShapeNode]] = []
    var interval = 0
    var framesPerUpdate = 10
    var strokeWidth: CGFloat = 1.5
    var loaded = false
    var normalStart = true
    var cellWidth = 40
    var cellHeight = 40
    
    func pause(){
        loaded = false
    }
    
    func reset() {
        var newCellStates: [[Bool]] = []
        for i in 0...cellWidth {
            var newCellRow: [Bool] = []
            for j in 0...cellHeight { 
                newCellRow.append(false)
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
    
    func start(){
        normalStart = false
        self.backgroundColor = .white
        for i in 0...cellWidth{
            var cellStateRow: [Bool] = []
            var cellRow: [SKShapeNode] = []
            for j in 0...cellHeight {
                let cell = SKShapeNode(rect: CGRect(x: 3 + cellSize*j, y: 3 + cellSize*i, width: cellSize, height: cellSize))
                cell.strokeColor = .black
                cell.lineWidth = CGFloat(strokeWidth)
                //                        cell.fillColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
                cell.fillColor = .white
                cellStateRow.append(false)
                cellRow.append(cell)
                addChild(cell)
            }
            cells.append(cellRow)
            cellStates.append(cellStateRow)
        }
    }    
    
    override func didMove(to view: SKView) {
        if normalStart{
            self.backgroundColor = .white
            for i in 0...cellWidth{
                var cellStateRow: [Bool] = []
                var cellRow: [SKShapeNode] = []
                for j in 0...cellHeight {
                    let cell = SKShapeNode(rect: CGRect(x: 3 + cellSize*j, y: 3 + cellSize*i, width: cellSize, height: cellSize))
                    cell.strokeColor = .black
                    cell.lineWidth = CGFloat(strokeWidth)
                    //                        cell.fillColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
                    cell.fillColor = .white
                    cellStateRow.append(false)
                    cellRow.append(cell)
                    addChild(cell)
                }
                cells.append(cellRow)
                cellStates.append(cellStateRow)
            }
        } 
        onSimulation()
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
    
    func onCell(x:Int,y:Int){
        cellStates[x][y] = true
        cells[x][y].fillColor = .black
    }
    
    func onSimulation(){
        loaded = true
    }
}

struct Chapter3_Previews: PreviewProvider {
    static var previews: some View {
        Chapter3()
    }
}
