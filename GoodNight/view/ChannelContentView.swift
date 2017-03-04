
import UIKit

// 屏幕宽
let screenWidth : CGFloat = UIScreen.main.bounds.size.width
// 屏幕高
let screenHeight : CGFloat = UIScreen.main.bounds.size.height
// 顶部状态的高度
let statusBarHeight : CGFloat = CGFloat(20)
// 底部导航的高度
let tabBarHeight : CGFloat =  CGFloat(49)
// 滑动标签页高度
let scrollLabelHeight : CGFloat = CGFloat(39)
// 菜单单个 Label 的宽度
let scrollLabelWidth : CGFloat = CGFloat(80)
// 菜单数据
let channelModel : ChannelModel = ChannelModel()
// 频道内容区高度
let channelContentHeight : CGFloat = screenHeight - statusBarHeight - scrollLabelHeight - tabBarHeight

class ChannelContentView : UIScrollView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 频道数量
        let channelCount : Int = channelModel.data.count

        // x , y , width , height
        self.frame = CGRect(x: 0, y: statusBarHeight + scrollLabelHeight, width: screenWidth, height: channelContentHeight)
        // 滑动区的内容区的大小
        self.contentSize = CGSize(width: CGFloat(channelCount) * screenWidth , height:channelContentHeight)
        // 背景色
        self.backgroundColor = UIColor.white
        // 是否按页滚动
        self.isPagingEnabled = true
        // 水平滚动，而不显示滚动条
        self.alwaysBounceHorizontal = true
        self.showsHorizontalScrollIndicator = true
        self.showsVerticalScrollIndicator = true
        // self.delegate = self
        
        var ii : Int = 0
        let layout = SingleMusicLayout()
        for var channel in channelModel.data {

            //let layout = UICollectionViewFlowLayout()
            //滚动方向
            //layout.scrollDirection = UICollectionViewScrollDirection.vertical
            //设置所有cell的size
            //layout.itemSize = CGSize(width:CGFloat(100), height: screenWidth )
            //上下间隔
            //layout.minimumLineSpacing = 0
            //左右间隔
            //layout.minimumInteritemSpacing = 0


            let singleChannelView = UICollectionView.init(frame: self.layer.bounds, collectionViewLayout: layout)
            singleChannelView.frame = CGRect(x: CGFloat(ii) * screenWidth, y: 0, width: screenWidth, height: channelContentHeight)
            singleChannelView.backgroundColor = UIColor.white

            self.addSubview(singleChannelView)
            ii += 1
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class SingleMusicLayout : UICollectionViewFlowLayout {

    var itemH: CGFloat = 100

    override init() {
        super.init();
        //滚动方向
        self.scrollDirection = UICollectionViewScrollDirection.vertical
        //设置所有cell的size
        self.itemSize = CGSize(width:screenWidth, height: itemH )
        //上下间隔
        self.minimumLineSpacing = 0
        //左右间隔
        self.minimumInteritemSpacing = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

/*
class SingleChannelView: UICollectionView {
 
    override init(frame: CGRect, layout: UICollectionViewLayout) {

        super.init(frame: frame, collectionViewLayout: layout)
        
        let layout = UICollectionViewFlowLayout()
        //滚动方向
        layout.scrollDirection = UICollectionViewScrollDirection.vertical
        //设置所有cell的size
        layout.itemSize = CGSize(width:CGFloat(100), height: screenWidth )
        //上下间隔
        layout.minimumLineSpacing = 0
        //左右间隔
        layout.minimumInteritemSpacing = 0
        
        // self.init(frame: self.layer.bounds, collectionViewLayout: layout)
        self.frame = CGRect(x: screenWidth, y: 0, width: screenWidth, height: channelContentHeight)
        self.backgroundColor = UIColor.white
        // delegate
        //self.layer.delegate = self
        //self.layer.data = self
        //注册一个cell
        // self.register(HotCell.self, forCellWithReuseIdentifier:"HotCell")
        //self.backgroundColor = UIColor.white
    }
}
*/

    /*
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
