//
//  GamesViewController.swift
//  Next UP
//
//  Created by Samuel Elbaz on 1/29/20.
//  Copyright © 2020 Samuel Elbaz. All rights reserved.
//

import UIKit
import AlamofireImage
import AVFoundation

class GamesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
 
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var games = [[String:Any]]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        tableView.dataSource = self
        tableView.delegate = self

        // Do any additional setup after loading the view.
        let url = URL(string: "https://api.rawg.io/api/games?dates=2020-01-01,2020-01-30&platforms=18,1,7")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
           // This will run when the network request returns
           if let error = error {
              print(error.localizedDescription)
           } else if let data = data {
              let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
            self.games = dataDictionary["results"] as! [[String:Any]]
            self.tableView.reloadData()

//            print(self.games[0]["name"]!)
            }
        }
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameDetailsTableViewCell") as! GameDetailsTableViewCell
        let game = games[indexPath.row]
        let title = game["name"] as! String
        let releaseDate = game["released"] as! String
        let backgroundImageURL = game["background_image"] as? String
        //Use optional to check for image.
        let imageCoverURL = URL(string: backgroundImageURL ?? "https://s.marketwatch.com/public/resources/images/MW-GL736_gamer__ZH_20180628143328.jpg")
        cell.imageCoverView.af_setImage(withURL: imageCoverURL!)
        cell.titleLabel.text = title
        cell.dateLabel.text = releaseDate
        
        //setup video
//        let testUrlVideo = "https://media.rawg.io/media/stories-320/d26/d2611ec94feb7f59bdc767b16f4af11e.mp4"
////        let videoURLDict = game["clip"]
////        let videoURLFull = videoURLArr!["full"] as? String
////        print(videoURLDict!)
////        guard let path = Bundle.main.path(forResource: testUrlVideo, ofType: "mp4") else{
////             debugPrint("file not found")
////            return cell
////        }
//        player = AVPlayer(url: URL(fileURLWithPath: testUrlVideo))
//        avPlayerLayer = AVPlayerLayer(player: player)
//        avPlayerLayer.videoGravity = AVLayerVideoGravity.resize
//
//        cell.videoView.layer.addSublayer(avPlayerLayer)
//        player.play()
       

        return cell
     }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    


}
