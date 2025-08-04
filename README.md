## Summary
When a SwiftUI widget uses a `Link` containing an `Image` modified with `.widgetAccentedRenderingMode` (using any mode except `.fullColor`), tapping the image on the widget launches the app but does not pass the expected deep link URL to the `SceneDelegate`.

## Steps to Reproduce

1. Create a SwiftUI Widget View with a Link:

    ```swift
    struct ImageView: View {
        var image: UIImage

        var body: some View {
            Link(destination: URL(string: "myapp://image")!) {
                Image(uiImage: entry.image)
                    .resizable()
                    .widgetAccentedRenderingMode(.accentedDesaturated) // Comment this line and deep link will work
                    .scaledToFill()
                    .clipped()
            }
        }
    }
    ```

2. Add Custom URL Scheme in `Info.plist`:

    ```xml
    <dict>
        <key>CFBundleURLName</key>
        <string>com.company.myapp</string>
        <key>CFBundleURLSchemes</key>
        <array>
            <string>myapp</string>
        </array>
    </dict>
    ```

3. Implement Deep Link Handling in `SceneDelegate`:

    ```swift
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let url = connectionOptions.urlContexts.first?.url {
            handle(url)
        }
    }

    func scene(_ scene: UIScene, openURLContexts urlContexts: Set<UIOpenURLContext>) {
        if let url = urlContexts.first?.url {
            handle(url)
        }
    }

    private func handle(_ url: URL) {
        // Process URL here
    }
    ```

4. Run the application on a device or simulator.  
5. Add the widget to the Home Screen.  
6. Tap the image inside the widget.

## Expected Result
The application launches and receives the URL in `SceneDelegate`, as expected.

## Actual Result
The application launches, but the URL is not passed to `SceneDelegate`

