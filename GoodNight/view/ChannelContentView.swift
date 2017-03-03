
import UIKit

class ChannelContentView: UIScrollView {

    /*
 
 
 func addCollectionView () {
 
 let layout = UICollectionViewFlowLayout()
 //滚动方向
 layout.scrollDirection = UICollectionViewScrollDirection.vertical
 //设置所有cell的size
 layout.itemSize = CGSize(width:Int(screenWidth / 2), height:Int(screenWidth / 2))
 //上下间隔
 layout.minimumLineSpacing = 0
 //左右间隔
 layout.minimumInteritemSpacing = 0
 // init collection
 collectionView = UICollectionView.init(frame: self.view.bounds, collectionViewLayout: layout)
 // x  y   width height
 collectionView?.frame = CGRect(x: 0, y: statusBarHeight + scrollLabelHeight, width: screenWidth, height: screenHeight-statusBarHeight-scrollLabelHeight-tabBarHeight)
 // delegate
 collectionView?.delegate = self
 collectionView?.dataSource = self;
 //注册一个cell
 collectionView!.register(HotCell.self, forCellWithReuseIdentifier:"HotCell")
 collectionView?.backgroundColor = UIColor.white
 self.view.addSubview(collectionView!)
 }
 
 // 有多少个 cell
 func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
 return 16;
 }
 
 // 每个 cell 的处理
 func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
 // default cover
 let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HotCell", for: indexPath) as! HotCell
 cell.frame = CGRect(x: (indexPath.row % 2) * Int(screenWidth / 2), y: Int(indexPath.row / 2) * Int(screenWidth / 2), width: Int(screenWidth / 2), height: Int(screenWidth / 2))
 // cell.layer.borderColor = UIColor.gray.cgColor
 // cell.layer.borderWidth = 1
 cell.label.text = "aaaa"
 
 return cell
 }
     
     
 */
}


/*
 
 
 class HotCell: UICollectionViewCell {
 
 var label = UILabel()
 
 var image = UIImageView()
 
 override init(frame: CGRect) {
 super.init(frame: frame)
 
 let cellWidth = self.layer.bounds.size.width
 
 label = UILabel.init(frame: self.bounds)
 self.addSubview(label)
 
 image = UIImageView.init(frame: self.layer.bounds)
 image.frame = CGRect(x: 20, y: 20, width: cellWidth - 40, height: cellWidth - 40)
 image.image = UIImage(named: "normal")
 self.addSubview(image)
 
 }
 
 required init?(coder aDecoder: NSCoder) {
 fatalError("init(coder:) has not been implemented")
 }
 
 }
 */
