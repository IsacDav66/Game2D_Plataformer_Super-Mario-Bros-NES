extends ParallaxBackground

var scrolling_spedd = 200

func  _process(delta):
	scroll_offset.x -= scrolling_spedd * delta
