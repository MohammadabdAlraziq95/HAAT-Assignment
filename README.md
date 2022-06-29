#  Basic Food Delivery Application

ordering food online mockup , the purpuse is to test my coding skills and ios mobile development knowledge.
<br />

# How To Run 

1- download the project <br />
2- go to project dirictory <br />
3- pod install <br />
4- run or test <br />
5- use phone "+972592750327" and authcode "0000" to login <br />


# Architecture 

 used clean MVVM protocol orianted Architecture <br />
 
 
# Storage Layer

 1- fake json reponse used json files (MealBrands.json , Users.json) <br />
 2- to store cart items used (CoreData) <br />
 3- to manage current user logged in used(UserDefualts) <br />

 
# Service Layer

 used (Alamofire , AlamofireImage) pods <br />


# UI Layer 

 1- used seperated storyboards (Main.storyboard , Home.storyboard , Cart.Stroyboard , Authentication.storyboard) <br />
 2- used Reusable UI just like (Reusable Cells , Custom Alert , CarouselView) <br />
 3- used (collectionViews , TableViews) to store dynamic data <br />
 4- some extensions used to beautify Views and adding new functinalites needed  ( UIImageView+Extension , UITextFiled+Extension , .. ) <br />
 5- used usuall UIView elements like (UITextField , UIButton , UIImageView , UILabel , ..)<br />
 
 
 # Logic Layer 
 1- used ViewModels to handle the logic for each ViewController <br />
 2- protocols used to bind data between objects  <br />
 3- viewcontroller extensions to confirm protocols <br />
 4- completion handlers used to get back results from Services <br />
 5- used struct , class to build model objects with codable <br /> 


# unit testing
 as a sample i done testing viewmodels and services and the code coverage was 23.2% <br />


# tools 

used swiftLint -> helping to achive clean code <br />
used firebase siwft package to manage crashes using Firebase Crashlytics , Firebase Analytics <br />


# video

https://user-images.githubusercontent.com/38591209/176437977-52a50fa9-f0b6-49b2-bd9e-ea4949b91cec.mov


# Screenshots

Authantication <br />

![](/HAAT-Assignment/Resources/Screenshots/Auth.png)


Resturants and Meals <br />

![](/HAAT-Assignment/Resources/Screenshots/Home.png)

Shopping Cart <br />

![](/HAAT-Assignment/Resources/Screenshots/Cart.png)

Crashlytics and Analysis <br />

![](/HAAT-Assignment/Resources/Screenshots/crashboard.png)
![](/HAAT-Assignment/Resources/Screenshots/cartViewControllerCrash.png)
![](/HAAT-Assignment/Resources/Screenshots/crashDetails.png)
![](/HAAT-Assignment/Resources/Screenshots/AnalyticsBoard.png)
![](/HAAT-Assignment/Resources/Screenshots/investigationPage.png)

