# -NotfiactionUtils
swift 3.0 简单的对Notifiaction进行了一些简单的封装，方便下自己、可能用处也不是很大、原生的其实也挺好用
不重复添加通知、提供统一管理所有通知、提供释放所有通知函数和释放那个通知的函数
#移除所有通知
NotificationUtils.share.removeAllNotification()
#移除单个通知
NotificationUtils.share.removeNotification("通知名称")
#设置通知，添加过的通知不会重复添加
NotificationUtils.share.setNotification(obs, "名称", selector: Selector,object: any)
#发送通知
NotificationUtils.share.postNotification(“名称”, object: any, userInfo: [])
![image](https://github.com/FarmerChina/RedDotView/blob/master/notification.gif)  
