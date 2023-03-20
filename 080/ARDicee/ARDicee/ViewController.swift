//
//  ViewController.swift
//  ARDicee
//
//  Created by Simone Margio
//  www.simonemargio.im
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = false
        
        // Create a cube
        // All measures are in metres
        let cube = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)
        // Define material cube
        let material = SCNMaterial()
        // Change color
        material.diffuse.contents = UIColor.cyan
        // Apply color
        cube.materials = [material]
        
        
        // Create a point into 3D space
        let node = SCNNode()
        // Set point's position
        node.position = SCNVector3(x: 0, y: -0.1, z: -0.5)
        // Apply geometry
        node.geometry = cube
        
        
        // Put this node into our ScreenView
        sceneView.scene.rootNode.addChildNode(node)
        
        // Add light
        sceneView.autoenablesDefaultLighting = true
        
        
        // This's default ARKit created by Apple
        // Create a new scene
        //let scene = SCNScene(named: "art.scnassets/ship.scn")!
        // Set the scene to the view
        //sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Check support
        if ARWorldTrackingConfiguration.isSupported {
            
            // Create a session configuration
            let configuration = ARWorldTrackingConfiguration()
            
            // Run the view's session
            sceneView.session.run(configuration)
            
        } else {
            fatalError("This devide doesn't support ARKit!")
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
