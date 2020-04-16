---
---

# Parent class for shared tutorial / slideshow methods
class Pages

  browserSupportsCSSProperty: (featureName) =>
    elm = document.createElement 'div'
    featureName = featureName.toLowerCase()

    return true if (elm.style[featureName] isnt undefined)

    domPrefixes = 'Webkit Moz ms O'.split(' ')
    featureNameCapital = featureName.charAt(0).toUpperCase() + featureName.substr(1)

    for i in [0...domPrefixes.length]
      if (elm.style[domPrefixes[i] + featureNameCapital] isnt undefined)
        return true

    false

class Slideshow extends Pages

  slideShowImages: {}

  constructor: ->
    @slideShowImages = window.slides
    @showNextSlide()
    super("browserSupportsCSSProperty")

  # Number of slides in slideshow
  numSlides: ->
    Object.keys(@slideShowImages).length

  # Get index for active slide
  activeIndex: ->
    activeIndex = $("#slideshow .active").index()

  # Index of next slide to show
  nextIndex: ->
    if @activeIndex() is @numSlides() - 1
      0
    else
      @activeIndex() + 1

  showNextSlide: ->
    @showSlideAtIndex @nextIndex()

  filename: (index) ->
    Object.keys(@slideShowImages)[index]

  title: (index) ->
    filename = @filename(index)
    @slideShowImages[filename]

  src: (index) ->
    "/images/slideshow/#{@filename(index)}.png"

  imgHtml: (index) ->
    $("<img src='#{@src(index)}' class='slide' alt='#{@title(index)}' />")

  # Has the image been loaded yet?
  isLoaded: (index) ->
    index + 1 <= $("#slideshow img").length

  showSlideAtIndex: (slideIndex) ->
    # Has the image been loaded? If not, load it
    if @isLoaded(slideIndex)
      @fadeInSlideAfterDelayAtIndex slideIndex

    else
      newImage = @imgHtml(slideIndex)

      # Is the image cached? (for IE, load completion might not get called)
      if newImage.complete or newImage.readyState is 4
        @addImageToSlideshow newImage
      # If it's not cached, load it
      else
        # Measure how long it takes to load the image
        # so we can compensate and shorten the slideshow delay
        start = new Date().getTime()
        newImage.load () =>
          elapsed = new Date().getTime() - start
          @addImageToSlideshow newImage, elapsed

  addImageToSlideshow: (image, loadTime = 0) ->
    # Assume it's a retina image @2x
    # If loaded image returns 0 as width, use the first child's width
    imageWidth = if image[0].width is 0 then $("#slideshow .slide")[0].width else image[0].width / 2
    # Add it to the DOM
    image.attr("width", imageWidth).appendTo '#slideshow'
    @fadeInSlideAfterDelayAtIndex $("#slideshow .slide").length - 1, loadTime

  fadeInSlideAfterDelayAtIndex: (slideIndex, shortenDelay = 0) ->
    # If shortenDelay is passed, it's used to shorten the delay between every new slide
    # It enables us to achieve consistent timing when loading new images
    delay = if shortenDelay < 3000 then 3000 - shortenDelay else 0
    setTimeout () =>

      if @browserSupportsCSSProperty "transition"
        # Hide the old image
        $("#slideshow .active").removeClass "active"

        # Fade in the new image
        $("#slideshow img:eq(#{slideIndex})").addClass "active"
        @showNextSlide()
      else
        # Fade with jQuery
        $("#slideshow .active").fadeTo 600, 0, () ->
          $(this).removeClass "active"

        newSlide = $("#slideshow img:eq(#{slideIndex})")
        newSlide.fadeTo 600, 1, () =>
          newSlide.addClass("active")
          @showNextSlide()
    , delay

# class Tutorial extends Pages

#   animateInOffset: 80
#   animateInClass: "dont-animate"

#   constructor: ->

#     @animateInClass = "animate-in" if @browserSupportsCSSProperty "transition"
#     # On scroll, check if a animate-in element is visible in the viewport.
#     # If so, remove the class so it animates in
#     $(window).scroll @animateInPresentElements

#     # Init tabs
#     $("#tutorial > .tabs a").click @tutorialTabClick
#     $(".question .tabs a").click @questionTabClick

#     # Add animate-in class to all li:s
#     $(".tutorial-list > li").addClass @animateInClass
#     $(".next-steps li").addClass @animateInClass

#     # Hide everything after the first question in every tutorial list
#     $(".tutorial-list").each (index, element) ->
#       questionIndex = $(element).find(".question").index()
#       $(element).find("> li:eq(" + questionIndex + ")").nextAll().not(".option-all").addClass "hidden"

#       # Show list items for the chosen question
#       chosenOption = $(element).find(".question .selected").attr("id")
#       $(element).find(".#{chosenOption}").removeClass "hidden"

#   # Enable steps to fade in again
#   resetTutorialStepsAfterStep: (stepIndex) ->
#     $(".tutorial-list.active > li:eq(#{stepIndex})").nextAll().addClass @animateInClass

#   resetAllTutorialSteps: ->
#     $(".tutorial-list.active > li").addClass @animateInClass

#   animateInPresentElements: (index) =>
#     windowHeight = $(window).height()
#     windowScrollPosition = $(window).scrollTop()
#     bottomScrollPosition = windowHeight + windowScrollPosition
#     $(".animate-in").not(".hidden").each (i,element) =>
#       $(element).removeClass @animateInClass if $(element).offset().top + @animateInOffset < bottomScrollPosition

#   tutorialTabClick: (e) =>
#     e.preventDefault()

#     @selectTab(e.currentTarget)

#     # Hide all tutorials
#     $(".tutorial-list.active").removeClass "active"

#     # Show the tutorial ilst for the clicked tab
#     href = $(e.currentTarget).attr "href"
#     $(href).addClass "active"

#     # If a step is present in the viewport, animate it in
#     @resetAllTutorialSteps()
#     @animateInPresentElements()

#   selectTab: (tab) =>
#     $(tab).closest(".tabs").find(".selected").removeClass "selected"
#     $(tab).addClass "selected"

#   questionTabClick: (e) =>
#     e.preventDefault()

#     # Hide all steps from the currently selected option
#     currentOption = $(e.currentTarget).closest(".tabs").find(".selected").attr("id")
#     @selectTab(e.currentTarget)

#     # Show all steps for the selected tab
#     $(".tutorial-list.active .#{currentOption}").addClass "hidden"
#     newOption = $(e.currentTarget).attr "id"
#     $(".tutorial-list.active .#{newOption}").removeClass "hidden"

#     # Enable already shown steps to be faded in again
#     # (that appear after the clicked question)
#     stepIndex = $(e.currentTarget).closest(".question").index()
#     @resetTutorialStepsAfterStep stepIndex

#     # If a step is present in the viewport, animate it in
#     @animateInPresentElements()

$ ->
  new Slideshow()
  # new Tutorial()
