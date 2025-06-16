# CleanHapticTouch
Helper functions for applying multiple SensoryFeedback view modifiers based on gesture type in Swift.

## What's supported
Taps, LongPresses

## Feedback Styles Supported 
All impact weights, success, warning, error

## How to use:
Simply attach .haptic(.[touch_type](parameters)) to the view (like a button, text, etc) you want to attach 
the haptic too. You can chain multiple .haptic(_) calls onto one view so that you can have different haptic feedback styles for taps/long presses/etc. 

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
