
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
// 频道数量
let channelCount : Int = channelModel.data.count
// Cell 高度
let cellHeight : CGFloat = CGFloat(150)

class ChannelContentView : UIScrollView, UIScrollViewDelegate {
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        // x , y , width , height
        self.frame = CGRect(x: 0, y: statusBarHeight + scrollLabelHeight, width: screenWidth, height: channelContentHeight)
        // 滑动区的内容区的大小
        self.contentSize = CGSize(width: CGFloat(channelCount) * screenWidth , height:channelContentHeight)
        // 背景色
        self.backgroundColor = UIColor.darkGray
        // 是否按页滚动
        self.isPagingEnabled = true
        // 水平滚动，而不显示滚动条
        self.alwaysBounceHorizontal = true
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        
        //
        self.delegate = self
        // self.selec = 0
        
        for ii in 0..<channelModel.data.count {
            // 初始化
            let oneChannelView = OneChannelView.init(frame: self.layer.bounds, layout: OneChannelLayout(), index: ii)
            // 大小, 坐标
            oneChannelView.frame = CGRect(x: CGFloat(ii) * screenWidth, y: 0, width: screenWidth, height: channelContentHeight)
            //oneChannelView.delegate = oneChannelView
            //oneChannelView.dataSource = oneChannelView
            // oneChannelView.cellData = channel
            // 添加到界面
            self.addSubview(oneChannelView)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        for ii in 0..<channelCount {
            let labelView : ChannelMenuLabel = ChannelMenuView().viewWithTag(100 + ii) as! ChannelMenuLabel
            labelView.font = UIFont.systemFont(ofSize: 20)
            labelView.layer.backgroundColor = UIColor.blue.cgColor
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class OneChannelLayout : UICollectionViewFlowLayout {

    override init() {
        super.init();
        //滚动方向
        self.scrollDirection = UICollectionViewScrollDirection.vertical
        //设置所有cell的size
        self.itemSize = CGSize(width:screenWidth, height: cellHeight )
        //上下间隔
        self.minimumLineSpacing = 0
        //左右间隔
        self.minimumInteritemSpacing = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class OneChannelView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate {
 
    let index: Int

    init(frame: CGRect, layout: UICollectionViewLayout, index: Int) {

        self.index = index

        super.init(frame: frame, collectionViewLayout: layout)

        // self.init(frame: self.layer.bounds, collectionViewLayout: layout)
        self.frame = CGRect(x: screenWidth, y: 0, width: screenWidth, height: channelContentHeight)
        self.backgroundColor = UIColor.white
        // delegate
        self.delegate = self
        self.dataSource = self
        //注册一个cell
        self.register(HotCell.self, forCellWithReuseIdentifier:"HotCell")
    }
    
    // 有多少个 cell
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return channelModel.data[index]["content"].count
    }

    // 每个 cell 的处理
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // default cover
        let ii : Int = indexPath.row
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HotCell", for: indexPath) as! HotCell
        cell.frame = CGRect(x: 0, y: indexPath.row * Int(cellHeight), width: Int(screenWidth), height: Int(cellHeight))
        cell.title.text = "\(channelModel.data[index]["content"][ii]["title"])"
        cell.intro.text = "\(channelModel.data[index]["content"][ii]["introduction"])"
        // cell.layer.borderColor = UIColor.gray.cgColor
        // cell.layer.borderWidth = 1
        return cell
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class HotCell: UICollectionViewCell {

    var cover = UIImageView()
    
    var title = UILabel()
    
    var intro = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let imageHeight = cellHeight - 20
        
        // 封面图
        cover = UIImageView.init(frame: self.layer.bounds)
        cover.frame = CGRect(x: 10, y: 10, width: imageHeight, height: imageHeight)
        cover.image = UIImage(named: "normal")
        self.addSubview(cover)
        
        // 标题
        title.frame = CGRect(x: imageHeight + 20 + 10, y: 10, width: screenWidth - imageHeight - 30, height: 20)
        // title.text = "标题"
        // title.textAlignment = NSTextAlignment.center
        // title.textColor = UIColor.lightGray
        self.addSubview(title)

        // 介绍
        intro.frame = CGRect(x: imageHeight + 30, y: 40, width: screenWidth - imageHeight - 40, height: imageHeight - 30)
        // intro.text = "这里放好听的歌的介绍"
        intro.textAlignment = NSTextAlignment.left
        intro.textColor = UIColor.lightGray
        // intro.backgroundColor = UIColor.blue
        self.addSubview(intro)
        
        // 插入下划线
        let hrView = UIView(frame: (self.layer.bounds))
        hrView.frame = CGRect(x: 0, y: self.layer.bounds.size.height, width: screenWidth, height: 1)
        hrView.layer.backgroundColor = UIColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 0.5).cgColor
        self.addSubview(hrView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
