//
//  DVMCardViewController.swift
//  DeckOfOneCard
//
//  Created by Jeremy Taylor on 12/1/20.
//

import UIKit

class DVMCardViewController: UIViewController {

    @IBOutlet weak var suitLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var cardImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCards()
    }
    
    @IBAction func drawButtonTapped(_ sender: Any) {
        fetchCards()
    }
    
    func fetchCards() {
        DVMCardController.drawNewCard(1) { (cards) in
            if let cards = cards {
                DVMCardController.fetchCardImage(cards[0]) { (cardImage) in
                    DispatchQueue.main.async {
                        if let cardImage = cardImage {
                            self.updateViews(card: cards[0], image: cardImage)
                        }
                    }
                }
            }
        }
    }
    
    func updateViews(card: DVMCard, image: UIImage) {
        cardImageView.image = image
        suitLabel.text = card.suit
        valueLabel.text = card.value
    }
}
