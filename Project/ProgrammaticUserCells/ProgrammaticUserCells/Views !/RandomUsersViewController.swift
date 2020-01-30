import UIKit

class RandomUsersViewController: UIViewController {

    private let mainView = MainView()
    
    private var randomUsers = [User]() {
      didSet {
          DispatchQueue.main.async {
              self.mainView.collectionView.reloadData()
          }
      }
    }
    
    override func loadView() {
      view = mainView
        view.backgroundColor = .white
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.collectionView.dataSource = self
        mainView.collectionView.delegate = self
        getRandomUsers()
    mainView.collectionView.register(UINib(nibName: "RandomUserCell", bundle: nil), forCellWithReuseIdentifier: "randomUserCell")
        
    }
    
    private func getRandomUsers() {
        
        UsersFetchingService.manager.getUsers { [weak self] (result) in
            switch result {
            case.failure(let error):
             let alertController = UIAlertController(title: "Network Error", message: "\(error)", preferredStyle: .alert)
                            
                            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                            
                            alertController.addAction(okAction)
                            
                            DispatchQueue.main.async {
                    self?.present(alertController,animated: true, completion: nil)
                            }
            case.success(let users):
                DispatchQueue.main.async {
                
                    self?.randomUsers = users
                }
            }
        }
    }
}

extension RandomUsersViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return randomUsers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let randomUserCell = collectionView.dequeueReusableCell(withReuseIdentifier: "randomUserCell", for: indexPath) as? RandomUserCell else {
            fatalError(" could not downcast to Random User Cell - check to see if the nib file is registered.")
        }

        let cellInRow = randomUsers[indexPath.row]

        randomUserCell.configureCell(for: cellInRow)
        
        randomUserCell.backgroundColor = .systemYellow

    return randomUserCell
}
    
    
}

extension RandomUsersViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let user = randomUsers[indexPath.row]
         
            
            //segue to the PodcastDetailController
            //access the PodcastDetailController from storyBoard
            
            //make sure that the storyBoard ID is set for the detail controller.
            
        let detailVC = UserDetailViewController()
            
        detailVC.randomUser = user
            
            // in the coming weels or nex week we will pass data using initializer / dependecy injection ex: PodcastDetailController(podcast:podcast)
            navigationController?.pushViewController( detailVC, animated: true)
        }

    }




