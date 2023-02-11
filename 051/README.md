# Day 51

&nbsp;

### Today's topic 🎯
ViewController lifecycle

&nbsp;


### Notes ✍️
- viewDidLoad()
	- The view is loaded. All IBOutlet and IBAction and others are linked to the view. This method is called only once, when the view is created.
- viewWillAppear()
	- Call soon after. Here you can set the various elements (for example show or hide the navigation bar). The user does not see this view.
- viewDidAppear()
	- This is the view the user sees.
- viewWillDisappear()
	- Called when the user interacts with the view. For example, it switches from one screen to another. If I am in screen A and click on a button that takes me to screen B, the viewWillDisappear() method is called before moving to B

- viewDidDisappear()
	- Last method that can be called to change the current view before the next one is loaded

&nbsp;

###  Result 🎉
![ViewController lifecycle](https://user-images.githubusercontent.com/110282927/190848451-186ccf13-db9d-4307-9bea-c47625f24fb8.png)

