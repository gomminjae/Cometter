// The Swift Programming Language
// https://docs.swift.org/swift-book
import UIKit

public enum ActionType {
    case pin
    case tap
}

public class Cometter: UIView {
    
    open var particleImage: UIImage?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    public var enableGestures: [ActionType] = [] {
        didSet {
            configuteActions()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    public func showParticles(with image: UIImage) {
    let resizedImage: UIImage = image.resized(to: CGSize(width: 20, height: 20))
        particle.contents = resizedImage.cgImage
        particleEmitter.emitterCells = [particle]
        self.layer.addSublayer(particleEmitter)
    }
    
    @objc func handlePin(sender: UIPanGestureRecognizer) {
        
        particleEmitter.emitterPosition = sender.location(in: self)
        
        if sender.state == .ended {
            particleEmitter.lifetime = 0
        } else if sender.state == .began {
            // Here you can set the image you want to display as particles
            showParticles(with: particleImage!)
            particleEmitter.birthRate = 30
            particleEmitter.lifetime = 1.0
        }
    }
    @objc func handleTap(sender: UITapGestureRecognizer) {
        guard sender.state == .ended else {
            return
        }
        particleEmitter.emitterPosition = sender.location(in: self)
        
        showParticles(with: particleImage!)
        particleEmitter.lifetime = 0.5
        particleEmitter.birthRate = 2
        particle.emissionRange = CGFloat.pi * 2
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.particleEmitter.lifetime = 0
        }
    }
    // MARK: - Properties
    lazy var panGestureRecognizer:
    UIPanGestureRecognizer = {
        let gestureRecognizer = UIPanGestureRecognizer()
        gestureRecognizer.addTarget(self, action: #selector(handlePin))
        return gestureRecognizer
    }()
    
    lazy var tapGestureRecognizer: UITapGestureRecognizer = {
        let gestureRecognizer = UITapGestureRecognizer()
        gestureRecognizer.addTarget(self, action: #selector(handleTap))
        return gestureRecognizer
    }()
    
    lazy var particleEmitter: CAEmitterLayer = {
        let emitter = CAEmitterLayer()
        //emitter.emitterShape = .point
        emitter.renderMode = .additive
        return emitter
    }()
    
    
    let particle = Particle()
    
    // MARK: - UI Setup
    func setupUI() {
        configuteActions()
    }
    
    private func configuteActions() {
        self.gestureRecognizers?.forEach { self.removeGestureRecognizer($0) }
        
        for gestureType in enableGestures {
            switch gestureType {
            case .pin:
                self.addGestureRecognizer(panGestureRecognizer)
            case .tap:
                self.addGestureRecognizer(tapGestureRecognizer)
            }
        }
    }
    
}

public class Particle: CAEmitterCell {
    
    public override init() {
        super.init()
        self.birthRate = 1
        self.lifetime = 1.0
        self.velocity = 100
        self.velocityRange = 50
        self.emissionLongitude = 90
        self.emissionRange = .pi * 2
        self.spinRange = 5
        self.scale = 0.5
        self.scaleRange = 0.25
        self.alphaSpeed = -1
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
