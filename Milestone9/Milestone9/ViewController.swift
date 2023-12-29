//
//  ViewController.swift
//  Milestone9
//
//  Created by Ceren Güneş on 29.12.2023.
//

import UIKit

class ViewController: UICollectionViewController {
    
    private var images = ["one", "two", "three", "five", "six", "seven", "eight", "eight", "three", "one", "six", "seven", "five", "two"]
    private var selectedIndex: IndexPath?
    private var showImage = [Bool](repeating: false, count: 16)
    private var timer: Timer?
    private var selectedIndexPaths = Set<IndexPath>()
    private var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Fruit match"
        navigationController?.navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(playAgain))
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        
        updateScore()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        cell.backgroundColor = showImage[indexPath.row] ? .white : .systemOrange
        cell.layer.cornerRadius = 8
        cell.imageView?.image = showImage[indexPath.row] ? UIImage(named: images[indexPath.row]) : nil
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndexPaths.insert(indexPath)
        
        showImage[indexPath.row].toggle()
        collectionView.reloadItems(at: [indexPath])
        
        startTimer(indexPath: indexPath)
        
        if selectedIndexPaths.count == 2 {
            checkSelectedImages()
        }
    }
    
    func startTimer(indexPath: IndexPath) {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerAction), userInfo: indexPath, repeats: false)
    }
    
    @objc func timerAction(timer: Timer) {
        guard let indexPath = timer.userInfo as? IndexPath else {
            return
        }
        
        showImage[indexPath.row] = false
        collectionView.reloadItems(at: [indexPath])
    }
    
    func checkSelectedImages() {
        let selectedIndexes = Array(selectedIndexPaths)
        
        let firstIndex = selectedIndexes[0].row
        let secondIndex = selectedIndexes[1].row
        
        let firstImage = images[firstIndex]
        let secondImage = images[secondIndex]
        
        if firstImage == secondImage {
            score += 1
            
            collectionView.performBatchUpdates({
                images.remove(at: firstIndex)
                images.remove(at: secondIndex)
                collectionView.deleteItems(at: [selectedIndexes[0], selectedIndexes[1]])
            }, completion: { _ in
                self.allMatched()
            })
        } else {
            score -= 1
        }
        
        updateScore()
        selectedIndexPaths.removeAll()
    }

    func updateScore() {
          navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Score: \(score)", style: .done, target: self, action: nil)
      }
    
    @objc func playAgain() {
        score = 0
        images = ["one", "two", "three", "five", "six", "seven", "eight", "eight", "three", "one", "six", "seven", "five", "two"].shuffled()
        showImage = [Bool](repeating: false, count: images.count)
        collectionView.reloadData()
        updateScore()
    }
    
    func allMatched() {
        if images.isEmpty {
            let ac = UIAlertController(title: "Congrats!", message: "You matched all the cards.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Play again", style: .default, handler: { [weak self]_ in
                self?.playAgain()
            }))
            ac.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(ac, animated: true)
        }
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width * 0.45, height: collectionView.bounds.width * 0.6)
    }
}
