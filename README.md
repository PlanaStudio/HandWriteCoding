# Handwrite Coding

A VS Code extension that lets you transform your editor into a handwritten, creative coding style with Google Fonts and custom font installation.

## Features

- Switch the editor to handwritten fonts such as Caveat, Kalam, Indie Flower, and more
- **No Admin Rights Required**: Installs fonts cleanly to the current user's `%LOCALAPPDATA%` folder
- **Terminal Isolation**: Keeps the Integrated Terminal readable with a monospace font while the editor uses your chosen handwriting font
- Browse a curated list of handwriting and monospace fonts
- Install fonts from Google Fonts or a custom font URL
- Install fonts from a local `.ttf` or `.otf` file
- Apply the chosen font directly to the VS Code editor
- **Seamless Auto-Restart**: Reliably restarts VS Code without losing your workspace so newly installed fonts take effect immediately
- Reset the editor font back to default

## Screenshot

The extension adds a sidebar panel where you can search, filter, and apply fonts.

## Installation

### From source

1. Clone or download this repository.
2. Open the folder in VS Code.
3. Run:

```bash
npm install
```

4. Press `F5` to run the extension in a new Extension Development Host window.

### Build package

```bash
npm run compile
npx @vscode/vsce package
```

This creates a `.vsix` package that can be installed manually or published to the VS Code Marketplace.

## Usage

1. Open the activity bar and select the "Font Switcher" panel.
2. Search or filter fonts.
3. Click a font to apply it to the editor.
4. Use the actions to install from a file or from a Google Fonts URL if needed.
5. Use the reset action to restore the default editor font.

## Commands

- `Font Switcher: Next Font`
- `Font Switcher: Previous Font`
- `Font Switcher: Pick Font`
- `Font Switcher: Reset to Default`
- `Font Switcher: Restart VS Code`
- `Font Switcher: Install Font from File`
- `Font Switcher: Install Font from URL`

## Configuration

You can configure default values in the VS Code settings:

- `fontSwitcher.fonts`

Example:

```json
"fontSwitcher.fonts": [
  "Caveat",
  "Kalam",
  "Shadows Into Light",
  "Permanent Marker"
]
```

## Notes

- The extension is designed primarily for Windows, as it seamlessly integrates with the Windows user-level font registry.
- A seamless VS Code restart is required after installing a brand new font. The extension handles this automatically.
- For custom fonts, use a valid `.ttf` or `.otf` file.

## License

MIT

## Contributing

Pull requests and improvements are welcome.
