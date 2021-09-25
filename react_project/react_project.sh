mkdir client
  mkdir client/dist
    touch client/dist/index.html
  mkdir client/src
    touch client/src/index.jsx
    mkdir client/src/components
      touch client/src/components/App.jsx

mkdir server
  touch server/index.js

touch webpack.config.js

cat /Users/$USER/DeveloperScripts/react_project/index-html > client/dist/index.html
cat /Users/$USER/DeveloperScripts/react_project/index-jsx > client/src/index.jsx
cat /Users/$USER/DeveloperScripts/react_project/app-jsx > client/src/components/App.jsx
cat /Users/$USER/DeveloperScripts/react_project/webpack-config > webpack.config.js
cat /Users/$USER/DeveloperScripts/react_project/index-js > server/index.js

npm init
npm install react react-dom express nodemon axios path webpack webpack-cli @babel/core babel-loader @babel/preset-env @babel/preset-react
# todo: This npm install command for modules doesn't specifcy which version of modules to install
# breaking updates break this scrip