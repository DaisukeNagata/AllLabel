# AllLabel
#### You can change round corners, border lines, margins with StoryBoard. Please set the class.

<img src="https://user-images.githubusercontent.com/16457165/50370868-f2c89680-05f1-11e9-96df-def362286cc1.png" width="400"><img src="https://user-images.githubusercontent.com/16457165/64490282-6270d580-d296-11e9-9b90-1b4e98f78f81.png" width="400">

#### An example of entering an amount.

```ruby
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: AllLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = 123222.JPYString
    }
}

```

![](https://github.com/daisukenagata/AllLabel/blob/master/MovieGIF.gif?raw=true)
