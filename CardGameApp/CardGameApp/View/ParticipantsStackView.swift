//
//  ParticipantsStackView.swift
//  CardGameApp
//
//  Created by kimdo2297 on 2020/02/23.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

class ParticipantsStackView: UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    private func configure() {
        setupProperties()
        addArrangedViews()
    }
    
    private func setupProperties() {
        axis = .vertical
        distribution = .fillEqually
        spacing = 20
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func addArrangedViews() {
        Participants.forEachMaxCase {
            addArrangedSubview(ParticipantStackView())
        }
    }
    
    func updateView(game: PokerGame) {
        setAllParticipantViewsNotHidden()
        updateSelectedParticipantViews(game: game)
        setNotParticipantViewsHidden(game: game)
    }
    
    private func setAllParticipantViewsNotHidden() {
        arrangedSubviews.forEach {
            $0.isHidden = false
        }
    }
    
    private func updateSelectedParticipantViews(game: PokerGame) {
        var participantsIndex = 0
        game.searchParticipants { (participant) in
            updateParticipant(at: participantsIndex, participant: participant)
            participantsIndex += 1
        }
    }
    
    private func updateParticipant(at index: Int, participant: Participant) {
        guard Controller.verifyIndex(index: index, arrLen: arrangedSubviews.count) else {
            return
        }
        
        let participantStackView = arrangedSubviews[index] as! ParticipantStackView
        participantStackView.updateView(name: participant.name, participant: participant)
    }
    
    private func setNotParticipantViewsHidden(game: PokerGame) {
        var participantsCount = 0
        game.participants.forEach {
            participantsCount += 1
        }
        
        for index in participantsCount ..< arrangedSubviews.count {
            arrangedSubviews[index].isHidden = true
        }
    }
    
}