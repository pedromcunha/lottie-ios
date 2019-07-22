//
//  ViewController.swift
//  lottie-swift
//
//  Created by buba447 on 01/07/2019.
//  Copyright (c) 2019 buba447. All rights reserved.
//

import UIKit
import Lottie

class ViewController: UIViewController {
  let animationView = AnimationView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    Animation.loadedFrom(url: URL(string: "https://assets3.lottiefiles.com/packages/lf20_luFFUg.json")!, closure: { [weak self] animation in
        guard let animation = animation else { return }
        self?.animationView.animation = animation
        self?.animationView.loopMode =  .loop
        self?.animationView.play(toMarker: "M1")
    }, animationCache: nil)
    
    animationView.contentMode = .scaleAspectFit
    animationView.isUserInteractionEnabled = true
    view.addSubview(animationView)

    let recognizer = UITapGestureRecognizer(target: self, action: #selector(tappedAnimationView(recognizer:)))
    
    
    animationView.addGestureRecognizer(recognizer)
    animationView.backgroundBehavior = .pauseAndRestore
    animationView.translatesAutoresizingMaskIntoConstraints = false
    animationView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
    animationView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    
    animationView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    animationView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
  }
    
  @objc func tappedAnimationView(recognizer: UITapGestureRecognizer) {
    self.animationView.play(fromMarker: "M1", toMarker: "M2", loopMode: .playOnce, completion: nil)
  }
  
  @objc func updateAnimation(sender: UISlider) {
    animationView.currentProgress = CGFloat(sender.value)
  }
}
