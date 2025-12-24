# DOS Game Player

A self-contained, offline-capable DOS game player using js-dos v8.

## 🎮 For End Users

### Play Online

Visit the live demo: **[Play DOS Games](https://YOUR-USERNAME.github.io/YOUR-REPO-NAME/)**

> ⚠️ **Note**: Replace `YOUR-USERNAME` and `YOUR-REPO-NAME` with your actual GitHub username and repository name.

### Features

- ✅ **100% Self-Contained**: All files are local, no CDN or internet required after setup
- ✅ **Pure Frontend**: No backend needed, works with any static HTTP server
- ✅ **Easy Controls**: 
  - Fullscreen button for immersive gameplay
  - Restart button to reload the game
  - Exit button to stop emulation
- ✅ **Clean UI**: Minimal, modern interface
- ✅ **Responsive**: Works on different screen sizes
- ✅ **Keyboard Shortcuts**: ESC to release mouse, F11 for fullscreen

### How to Use

- **Fullscreen**: Click the "Fullscreen" button or press F11
- **Restart Game**: Click "Restart" to reload the game from beginning
- **Exit**: Click "Exit" to stop the emulator (refresh page to restart)
- **Mouse Control**: Click in the game area to capture mouse, press ESC to release

---

## 👨‍💻 For Developers

### Quick Start (Local Development)

1. **Start a local web server** (required - won't work with file:// protocol):

   ```bash
   python3 -m http.server 8080
   ```

   Or with Python 2:
   ```bash
   python -m SimpleHTTPServer 8080
   ```

2. **Open in browser**:
   ```
   http://localhost:8080
   ```

3. **Play!** Click the play button when the game loads

### Building for Deployment

To create a production build for GitHub Pages:

```bash
./build.sh
```

This creates a `gh-pages/` folder with all necessary files, ready for deployment.

### Testing the Build Locally

```bash
cd gh-pages
python3 -m http.server 8080
```

Then visit `http://localhost:8080`

### GitHub Actions Deployment

The repository includes automated deployment via GitHub Actions:

1. **Enable GitHub Pages**:
   - Go to your repository Settings → Pages
   - Set Source to "Deploy from a branch"
   - Select the `gh-pages` branch
   - Click Save

2. **Automatic Deployment**:
   - Every push to `main` branch triggers a build and deployment
   - You can also manually trigger deployment from Actions tab

3. **Monitor Deployment**:
   - Check the Actions tab for build status
   - Once complete, your site will be live at `https://YOUR-USERNAME.github.io/YOUR-REPO-NAME/`

## Project Structure

```
dosg/
├── index.html          # Main game player page
├── game.html           # Individual game page
├── games.json          # Game metadata
├── mapping.json        # Game mappings
├── lib/                # js-dos library (self-contained)
│   ├── js-dos.js       # Main library
│   ├── js-dos.css      # Styles
│   └── emulators/      # WebAssembly emulator files
├── dosbox/             # DOS game bundles
│   └── *.zip           # Game files
├── build.sh            # Build script for GitHub Pages
├── .github/
│   └── workflows/
│       └── deploy.yml  # GitHub Actions deployment
├── node_modules/       # npm packages (not needed for runtime)
└── package.json        # npm config (not needed for runtime)
```

### What Gets Deployed

The `build.sh` script creates a `gh-pages/` folder containing only the essential files:
- HTML files (index.html, game.html)
- JSON files (games.json, mapping.json)
- lib/ directory (js-dos library)
- dosbox/ directory (game bundles)
- README.md
- .nojekyll (prevents Jekyll processing)

#### Where to Get the `lib/` Folder


The `lib/` folder contains the [js-dos](https://js-dos.com/) library and emulator files. In this project, these files are managed via npm:

- The `package.json` includes `js-dos` as a dependency.
- After running `npm install`, you can copy the necessary files from `node_modules/js-dos/dist/` (such as `js-dos.js`, `js-dos.css`, and the `emulators/` directory) into your project's `lib/` folder as shown above.

Alternatively, you can obtain the latest version from the [js-dos releases](https://github.com/caiiiycuk/js-dos/releases) page on GitHub.

Files **NOT** included in deployment:
- node_modules/
- .git/
- .github/ (workflow files)
- build.sh
- package.json
- Development files

## Adding More Games

To add more games:

1. Place your DOS game .zip or .jsdos bundle in the `dosbox/` folder
2. Update `games.json` with the game metadata
3. Update `mapping.json` if needed
4. Run `./build.sh` to rebuild for deployment
5. Commit and push to trigger automatic deployment

## Deployment Options

### Option 1: GitHub Pages (Automated)

1. Push your code to GitHub
2. Enable GitHub Pages in repository settings
3. Every push to `main` triggers automatic deployment via GitHub Actions

### Option 2: Manual Deployment

1. Run `./build.sh` to create the `gh-pages/` folder
2. Copy the contents to your web server
3. Serve with any static HTTP server (Apache, Nginx, Python, Node.js, etc.)

### Option 3: Local Testing

```bash
# Test current development version
python3 -m http.server 8080

# Or test the built version
./build.sh
cd gh-pages
python3 -m http.server 8080
```

**Important**: Must be served via HTTP/HTTPS, not file:// protocol

## Technical Details

- **js-dos Version**: 8.3.20
- **Emulator Backend**: DOSBox (WebAssembly)
- **Browser Requirements**: Modern browser with WebAssembly support
- **Offline**: All assets are local, fully functional without internet
- **Deployment**: Automated via GitHub Actions

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Test locally with `python3 -m http.server 8080`
5. Build with `./build.sh` to verify deployment build
6. Commit your changes (`git commit -m 'Add amazing feature'`)
7. Push to the branch (`git push origin feature/amazing-feature`)
8. Open a Pull Request

## Troubleshooting

### GitHub Pages Not Working

- Verify GitHub Pages is enabled in Settings → Pages
- Check that `gh-pages` branch exists after first deployment
- Wait a few minutes after deployment for changes to propagate
- Check Actions tab for deployment errors

### Games Not Loading

- Ensure you're accessing via HTTP/HTTPS (not file://)
- Check browser console for errors
- Verify game files exist in `dosbox/` folder
- Check that `games.json` and `mapping.json` are properly formatted

### Build Script Fails

- Ensure `build.sh` has execute permissions: `chmod +x build.sh`
- Verify all required files exist (index.html, game.html, lib/, dosbox/)
- Check for sufficient disk space

- js-dos by @caiiiycuk - https://js-dos.com/
- github.com/rwv/chinese-dos-games

