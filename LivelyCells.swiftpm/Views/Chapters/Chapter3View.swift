import SwiftUI
import SpriteKit

struct Chapter3: View {
    @State var started = [false,false,false,false,false,false]
    @State var treeProbability:Float = 10.0
    @State var fireProbability:Float = 10.0
    
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
                    }
                    Group{
                        Text("""
Inside Conway's Game of Life, there are many super cool patterns you can notice. These patterns are defined by the behaviour they exhibit.

The following patterns are considered ***still life***. These means they do not change at all and stay stable.
""")
                        
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
                    }
                    Text("These following pattern is called a ***seed*** as they are able to generate for long periods of time")
                    HStack{
                        Spacer()
                        if started[3]{
                            VStack{
                                SpriteView(scene: scene4)
                                    .frame(width: 390, height: 390)
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
//                    applications
                    Group{
                        Rectangle()
                            .cornerRadius(10)
                            .foregroundColor(.secondary)
                            .frame(height: 2)
                        Text("Applications of Cellular Automata")
                            .font(.title)
                            .frame(maxWidth:.infinity,alignment: .center)
                        Text("In addition to being super cool, Cellular Automata also has valuable applications that we can use.")
                        Text("The following is a model by Drossel and Schwabl from 1992 of a forest fire represented by cellular automata. This is a Cellular Automata with three states: empty, tree and burning making it different from any we've seen so far. Therefore it has to use the following different rules:")
                        Text("""
• If a cell is **burning**, it becomes **empty**
• If a cell is a **tree** and has a **burning** cell next to it, it becomes **burning**
• A **tree** randomly ignites with a set probability
• A **empty** cell randomly grows a **tree** with a different set probability

The red cells are **burning**, the green cells are **tree** and the brown cells are **empty**
""")
                        HStack{
                            Spacer()
                            if started[4]{
                                VStack{
                                    SpriteView(scene: scene5)
                                        .frame(width: 390, height: 390)
                                    HStack{
                                        Text("Tree Probability: \(treeProbability/1000)")
                                        Slider(
                                            value: $treeProbability,
                                            in: 0...100,
                                            onEditingChanged: { editing in 
                                                fireScene.setProbabilityTree(newP: treeProbability)
                                            }
                                        )
                                    }
                                    HStack{
                                        Text("Fire Probability: \(fireProbability/100000)")
                                        Slider(
                                            value: $fireProbability,
                                            in: 0...100,
                                            onEditingChanged: { editing in 
                                                fireScene.setProbabilityFire(newP: fireProbability)
                                            }
                                        )  
                                    }
                                }
                            } else{
                                Button(action: {
                                    for i in 0..<started.count{
                                        started[i] = false
                                        if i == 4 {
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
                        Text("Simulating a forest fire can help provide fire fighters to find where the fire will spread next which helps in combatting it and assessing the damages.")
                        
                        Text("""
The following is a Cave Generation algorithm using Cellular Automata. It starts off at a random initial state and follows these rules:
• If the cell is on and has at least 4 on neighbours it stays on 
• If the cell is not on but has at least 5 on neighbours then it turns on
• All other cells turn off.
• It then goes through 12 iterations before ending.

This creates a convolution that reduces the noise in the grid.
""")
                        HStack{
                            Spacer()
                            if started[5]{
                                VStack{
                                    SpriteView(scene: scene6)
                                        .frame(width: 390, height: 390)
                                    HStack{
                                        Spacer()
                                        Button(action: {
                                            caveScene.start()
                                        }, label: {
                                            Text("Create New Cave")
                                        })
                                        .buttonStyle(.borderedProminent)
                                        Spacer()
                                    }
                                }
                            } else{
                                Button(action: {
                                    for i in 0..<started.count{
                                        started[i] = false
                                        if i == 5 {
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
                        Text("This can be used to generate caves for video game environments!")
                    }
                }
            }
            .padding(.horizontal, 20)
        }
    }
    
    var caveScene = CaveScene()
    
    var scene6: SKScene {
        let scene = caveScene
        scene.size = CGSize(width: 390, height: 390)
        scene.scaleMode = .fill
        return scene
    }
    
    var fireScene = ForestFire()
    
    var scene5: SKScene {
        let scene = fireScene
        scene.size = CGSize(width: 390, height: 390)
        scene.scaleMode = .fill
        return scene
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

class ForestFire: SKScene {
//    probably shouldve used enum butf key 0 is empty 1 is tree 2 is fire
    var cellSize: Int = 9
    var cellStates: [[Int]] = [] 
    var cells: [[SKShapeNode]] = []
    var interval = 0
    var framesPerUpdate = 10
    var strokeWidth: CGFloat = 1.5
    var loaded = false
    var normalStart = true
    var cellWidth = 40
    var cellHeight = 40
    var fireP:Float = 10.0
    var treeP:Float = 10.0
    
    func pause(){
        loaded = false
    }
    
    func setProbabilityFire(newP:Float){
        fireP = newP
    }
    
    func setProbabilityTree(newP:Float){
        treeP = newP
    }
    
    func reset() {
        var newCellStates: [[Int]] = []
        for i in 0...cellWidth {
            var newCellRow: [Int] = []
            for j in 0...cellHeight { 
                newCellRow.append(0)
            }
            newCellStates.append(newCellRow)
        }
        cellStates = newCellStates
        for i in 0...cellWidth {
            for j in 0...cellHeight {
                cells[i][j].fillColor = .brown
            }
        }
    }
    
    func start(){
        normalStart = false
        self.backgroundColor = .white
        for i in 0...cellWidth{
            var cellStateRow: [Int] = []
            var cellRow: [SKShapeNode] = []
            for j in 0...cellHeight {
                let cell = SKShapeNode(rect: CGRect(x: 3 + cellSize*j, y: 3 + cellSize*i, width: cellSize, height: cellSize))
                cell.strokeColor = .black
                cell.lineWidth = CGFloat(strokeWidth)
                //                        cell.fillColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
                cell.fillColor = .brown
                cellStateRow.append(0)
                cellRow.append(cell)
                addChild(cell)
            }
            cells.append(cellRow)
            cellStates.append(cellStateRow)
        }
    }    
    
    override func didMove(to view: SKView) {
        if normalStart{
            start()
        } 
        onSimulation()
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        //        make sure that didMove finishes running first
        if loaded {
//            if interval == 1 {
                var newCellStates: [[Int]] = []
                for i in 0...cellWidth {
                    var newCellRow: [Int] = []
                    for j in 0...cellHeight {
                        newCellRow.append(calculateNeighbours(x: i, y: j))
                    }
                    newCellStates.append(newCellRow)
                }
                cellStates = newCellStates
                for i in 0...cellWidth {
                    for j in 0...cellHeight {
                        if cellStates[i][j] == 0 {
                            cells[i][j].fillColor = .brown
                        } else if cellStates[i][j] == 1 {
                            cells[i][j].fillColor = .green
                        } else {
                            cells[i][j].fillColor = .red
                        }
                    }
                }
//                interval = 0
//            }
        }
    }
    
    func calculateNeighbours(x:Int, y:Int) -> Int {
        let neighbourList = [[-1,-1],[-1,0],[-1,1],[0,-1],[0,1],[1,-1],[1,0],[1,1]]
        let ownState = cellStates[x][y]
        
//        if dirt
        if ownState == 0 {
//            simulate 50% 5/100
            if Float(Int.random(in: 0..<1000)) < treeP{
                return 1
            } else {
                return 0
            }
        } 
        
//        if fire
        if ownState == 2 {
            return 0
        }
        
//        remaining should be trees
        
//        random ignition
        if Float(Int.random(in: 0..<100000)) < fireP {
            return 2
        }
        
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
            //should be fine aslong as simulation stays square
            case cellHeight + 1: 
                neighbourY = 0
            default:
                break
            }
            if cellStates[neighbourX][neighbourY] == 2{
                return 2
            }
        }
        return 1
    }
    
    func onCell(x:Int,y:Int){
        cellStates[x][y] = 1
        cells[x][y].fillColor = .black
    }
    
    func onSimulation(){
        loaded = true
    }
}

class CaveScene: SKScene {
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
        cells = []
        cellStates = []
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
                if Bool.random() {
                    cell.fillColor = .black
                    cellStateRow.append(true)                    
                } else{
                    cell.fillColor = .white
                    cellStateRow.append(false)
                }
                cellRow.append(cell)
                addChild(cell)
            }
            cells.append(cellRow)
            cellStates.append(cellStateRow)
        }
        interval = 0
    }    
    
    override func didMove(to view: SKView) {
        if normalStart{
            start()
        } 
        onSimulation()
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        //        make sure that didMove finishes running first
        if loaded {
            if interval < 10 {
                var newCellStates: [[Bool]] = []
                for i in 0...cellWidth {
                    var newCellRow: [Bool] = []
                    for j in 0...cellHeight {
                        let neighbours = calculateNeighbours(x: i, y: j)
                        if cellStates[i][j] && neighbours > 3  {
                            newCellRow.append(true)
                        } else if cellStates[i][j] {
                            newCellRow.append(false)
                        } else if !cellStates[i][j] && neighbours > 4 {
                            newCellRow.append(true)
                        } else {
                            newCellRow.append(false)
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
