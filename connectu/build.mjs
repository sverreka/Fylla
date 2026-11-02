// Build connectU into a single self-contained HTML file.
//   node build.mjs app       -> www/index.html  (React bundled in; used by Capacitor for iOS/Android and for any web host)
//   node build.mjs artifact  -> dist/connectu.html (React loaded from cdnjs; used for the hosted preview)
import { build } from 'esbuild';
import { mkdirSync, readFileSync, writeFileSync } from 'node:fs';
import { fileURLToPath } from 'node:url';
import path from 'node:path';

const root = path.dirname(fileURLToPath(import.meta.url));
const target = process.argv[2] || 'app';
const css = readFileSync(path.join(root, 'src/styles.css'), 'utf8');

const shims = target === 'artifact'
  ? { react: path.join(root, 'src/shims/react.js'), 'react-dom/client': path.join(root, 'src/shims/react-dom-client.js') }
  : {};

const result = await build({
  entryPoints: [path.join(root, 'src/main.jsx')],
  bundle: true,
  minify: true,
  write: false,
  format: 'iife',
  target: ['es2020'],
  jsx: 'transform',
  jsxFactory: 'React.createElement',
  jsxFragment: 'React.Fragment',
  define: { 'process.env.NODE_ENV': '"production"' },
  alias: shims,
  nodePaths: (process.env.NODE_PATH || '').split(path.delimiter).filter(Boolean),
  logLevel: 'warning',
});
const js = result.outputFiles[0].text.replace(/<\/script/gi, '<\\/script');

const fonts = '<link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>'
  + '<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Figtree:wght@400;600;700;800;900&display=swap">';

if (target === 'artifact') {
  const html = `<title>connectU</title>
<meta name="claude:viewport-fit-sides" content="cover">
${fonts}
<style>${css}</style>
<div id="root"></div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/react/18.3.1/umd/react.production.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/react-dom/18.3.1/umd/react-dom.production.min.js"></script>
<script>${js}</script>
`;
  mkdirSync(path.join(root, 'dist'), { recursive: true });
  writeFileSync(path.join(root, 'dist/connectu.html'), html);
  console.log('dist/connectu.html', (html.length / 1024).toFixed(0) + ' KB');
} else {
  const html = `<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
<meta name="theme-color" content="#F7ECE8">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-title" content="connectU">
<link rel="manifest" href="manifest.webmanifest">
<title>connectU</title>
${fonts}
<style>${css}</style>
</head>
<body>
<div id="root"></div>
<script>${js}</script>
</body>
</html>
`;
  mkdirSync(path.join(root, 'www'), { recursive: true });
  writeFileSync(path.join(root, 'www/index.html'), html);
  writeFileSync(path.join(root, 'www/manifest.webmanifest'), JSON.stringify({
    name: 'connectU', short_name: 'connectU', start_url: '.', display: 'standalone',
    background_color: '#F7ECE8', theme_color: '#C8603A', description: 'Find your perfect roommate match',
  }, null, 2));
  console.log('www/index.html', (html.length / 1024).toFixed(0) + ' KB');
}
