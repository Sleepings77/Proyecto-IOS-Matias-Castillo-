
import UIKit
import Foundation

extension CardsViewController {
    @IBAction func handerSegmentChange (_ sender: UISegmentedControl) {
        
        switch (segmentControl.selectedSegmentIndex) {
            case 0:
                getAllCards()
            case 1:
                getShamanCards()
            case 2:
                getHunterCards()
            case 3:
                getRogueCards()
            case 4:
                getWarriorCards()
            case 5:
                getPriestCards()
            case 6:
                getDruidCards()
            case 7:
                getPaladinCards()
            case 8:
                getNeutralCards()
            default:
                getMageCards()
        }
        cardsView.reloadData()
    }
    
    private func getAllCards(){
        self.filteredData = cards.filter {
            $0.cardClass == $0.cardClass
        }
    }
    private func getShamanCards(){
        self.filteredData = cards.filter {
            $0.cardClass == "SHAMAN"
        }
    }
    private func getHunterCards(){
        self.filteredData = cards.filter {
            $0.cardClass == "HUNTER"
        }
    }
    private func getRogueCards(){
        self.filteredData = cards.filter {
            $0.cardClass == "ROGUE"
        }
    }
    private func getWarriorCards(){
        self.filteredData = cards.filter {
            $0.cardClass == "WARRIOR"
        }
    }
    private func getPriestCards(){
        self.filteredData = cards.filter {
            $0.cardClass == "PRIEST"
        }
    }
    private func getDruidCards(){
        self.filteredData = cards.filter {
            $0.cardClass == "DRUID"
        }
    }
    private func getPaladinCards(){
        self.filteredData = cards.filter {
            $0.cardClass == "PALADIN"
        }
    }
    private func getNeutralCards(){
        self.filteredData = cards.filter {
            $0.cardClass == "NEUTRAL"
        }
    }
    private func getMageCards(){
        self.filteredData = cards.filter {
            $0.cardClass == "MAGE"
        }
    }
}
