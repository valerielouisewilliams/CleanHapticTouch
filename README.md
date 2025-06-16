# CleanHapticTouch
Helper functions for applying multiple SensoryFeedback view modifiers based on gesture type in Swift.

## What's supported:
Taps, LongPresses

## Feedback styles supported:
All impact weights, success, warning, error

## How to use:
Simply attach .haptic(.TouchTypeGoesHere(parameters)) to the view (like a button, text, etc) you want to attach 
the haptic to. You can chain multiple .haptic(_) calls onto one view so that you can have different haptic feedback styles for taps/long presses/etc. 
Note: In the GestureHapticModifier struct, you must change the 'trigger' state variable to match whatever you trigger is. As a default, I have it set as a UUID value.

## Example code: 

    public var ExampleView: some View {
        VStack {
            Button(action: someActionHere) {
                Text("Button Label")
            }
            // Applies a heavy impact feedback to a tap gesture
            .haptic(.tap(.heavy)) 
            // Applies a light impact feedback to a long press gesture
            .haptic(.longPress(duration: 0.2, feedback: .light)) 

        }
    }

## More info on SensoryFeedback API:
https://developer.apple.com/documentation/swiftui/view/sensoryfeedback(_:trigger:)
