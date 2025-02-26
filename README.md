# Material Design Seed Color Picker

A web tool for generating Material Design 3 color schemes from a seed color. Try it out at: [Material Design Seed Picker](https://christianfindlay.github.io/seed_color_picker/)

![Material Design Seed Color Picker Interface](seedcolorpicker.png)

## Features

### Color Selection Interface
- **Color Input Field**: Enter a hex color code (e.g., `FF2D5C6A`) at the top of the screen
- **Color Picker**: Use the interactive color picker to visually select your desired seed color
- **RGB Controls**: Fine-tune your color using RGB sliders and input fields
- **Alpha Channel**: Adjust transparency with the alpha channel slider (0-100%)

### Color Preview
The tool displays four key color swatches that demonstrate how your seed color translates into a Material Design color scheme:

1. **seed**: Your selected base color that generates the entire scheme
2. **primary**: The main color derived from your seed color, used for primary UI elements
3. **errorContainer**: System-generated error state color for error containers and backgrounds
4. **inversePrimary**: Automatically calculated inverse of the primary color for contrast elements

### Navigation
The top navigation bar includes tabs for different aspects of Material Design:
- 🎨 Colors
- 🔘 Buttons
- 📇 Cards
- ⌨️ Inputs
- 🔄 Animations
- 📝 Lists

### Light/Dark Mode
- Toggle between light and dark modes using the sun/moon icon in the top right corner
- Preview how your color scheme adapts to different themes

## How to Use

1. **Select a Color**:
   - Type a hex code directly into the input field, or
   - Use the color picker to visually select your color
   - Fine-tune using RGB sliders

2. **Preview the Results**:
   - The four color swatches automatically update to show how your seed color generates a Material Design color scheme
   - Toggle light/dark mode to see how your colors adapt

3. **Copy Colors**:
   - Click on any color swatch to copy its hex value
   - Use these colors in your Material Design projects

## Technical Details

This tool is built with Flutter Web and uses WASM for improved performance. It implements Material Design 3's color system algorithms to generate harmonious color schemes from a single seed color.

## Browser Compatibility

For the best experience, use Chrome 119+ or Edge 119+. The app uses WebAssembly with Garbage Collection (WASM GC), which requires modern browser support.


