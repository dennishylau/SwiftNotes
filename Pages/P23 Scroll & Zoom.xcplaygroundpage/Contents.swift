//:## ScrollView

/*:```

Put SV into View, then put content insider SV
In storyboard, select VC with SV inside, CMD+OPT+5, set sim size to freeform to view long SV content

```*/

//:## Zoom
/*:```
Conform VC class to UIScrollViewDelegate\
@IBOutlet for both the SV and the viewWithin\
In viewDidLoad,
````
scrollView.delegate = self
initZoomFor(view.bounds.size)
````
Also in viewDidLoad, call UIScrollViewDelegate method:\
````
func viewForZooming(in scrollView: UIScrollView) -> UIView? {
	return viewWithin
}
````
In VC class, call:
````
func initZoomFor(_ size: CGSize) {

	//		divide screen size by viewWithin size

	let widthScale = size.width / viewWithin.bounds.width
	let heightScale = size.height / viewWithin.bounds.height

	//		get min of two so entire image will show

	let scale = min(widthScale, heightScale)

	scrollView.minimumZoomScale = scale
	scrollView.zoomScale = scale
}
````

```*/
