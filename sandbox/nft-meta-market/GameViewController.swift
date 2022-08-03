//
//  GameViewController.swift
//  sandbox
//
//  Created by Federico Lagarmilla on 3/8/22.
//

import UIKit
import QuartzCore
import SceneKit
import GLTFSceneKit

class GameViewController: UIViewController {
    
    let sampleModel = "https://arweave.net/v_mLILVhfJBimh7bLFneRJZdrRE1eYCJWazOppDh_RQ"
    
    var gameView: SCNView? {
        get { return self.view as? SCNView }
    }
    var scene: SCNScene?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var scene: SCNScene
        do {
            let sceneSource = try GLTFSceneSource(url: URL(string: sampleModel)!)
            scene = try sceneSource.scene()
        } catch {
            print("\(error.localizedDescription)")
            return
        }
        
        self.setScene(scene)
        
        self.gameView!.autoenablesDefaultLighting = true
        
        // allows the user to manipulate the camera
        self.gameView!.allowsCameraControl = true
        
        // show statistics such as fps and timing information
        self.gameView!.showsStatistics = true
        
        // configure the view
        self.gameView!.backgroundColor = UIColor.blue

        self.gameView!.delegate = self
        self.view.backgroundColor = UIColor.clear
    }
    
    func setScene(_ scene: SCNScene) {
        // set the scene to the view
        self.gameView!.scene = scene
        self.scene = scene

        //to give nice reflections :)
        scene.lightingEnvironment.intensity = 2;
    }
}

extension GameViewController: SCNSceneRendererDelegate {
  func renderer(_ renderer: SCNSceneRenderer, didApplyAnimationsAtTime time: TimeInterval) {
    self.scene?.rootNode.updateVRMSpringBones(time: time)
  }
}
