#!/bin/bash

# version: 2.0
# Autor: Arthur Lucena - 2024 : https://arthur-vsl.vercel.app/
# About script: I use this script to automate some configuration steps within my Next.js projects, and I thought it would be interesting to share the solution with other Linux users and Next.js developers.

clear

echo "Initialize script..."

clear
echo "Creating files..."
echo -e "📝 - custom.d.ts \n📝 - next.config.mjs \n📝 - app.routes.ts"
sleep 1

# ---------------------------------------------------------------------------
touch custom.d.ts
echo "/* @arthur.vsl */

// Declarações necessárias para outros tipos de mídia

declare module '*.mp4' {
    const src: string;
    export default src;
}

declare module '*.webm' {
    const src: string;
    export default src;
}
" > custom.d.ts

# ---------------------------------------------------------------------------
touch next.config.mjs
echo -e "/* @arthur.vsl */

/** @type {import('next').NextConfig} */
const nextConfig = {
    webpack(config) {
      config.module.rules.push({
        test: /\.(mp4|webm|ogg|swf|avi|mov|mkv)$/,
        use: {
          loader: 'file-loader',
          options: {
            publicPath: '/_next/static/videos/',
            outputPath: 'static/videos/',
            name: '[name].[hash].[ext]',
          },
        },
      });
  
      return config;
    },
  };
  
  export default nextConfig;
" > next.config.mjs

clear
echo "Creating files..."
echo -e "📄 - custom.d.ts \n📝 - next.config.mjs \n📝 - app.routes.ts"
sleep 0.5

clear
echo "Creating files..."
echo -e "📄 - custom.d.ts \n📄 - next.config.mjs \n📝 - app.routes.ts"
sleep 0.5

# ---------------------------------------------------------------------------
cd ./src/app

touch app.routes.ts
echo "/* @arthur.vsl */

const AppRoutes = {
    home: '/',
    pageWithId: (id:number) => \`/page_path\${id}\`
};
export default AppRoutes;" > app.routes.ts

clear
echo "Creating files..."
echo -e "📄 - custom.d.ts \n📄 - next.config.mjs \n📄 - app.routes.ts"
sleep 0.5

# -----------------------------------------------------------------------------------------------------------------------

#📁📂

clear
echo "Creating subfolders..."
#echo -e "📂 - assets \n📂 - components \n📂 - context \n📂 - linux \n📂 - modules \n📂 - pages \n📂 - styles \n📂 - utils"
sleep 1

folders=(
    "assets"
    "components"
    "context"
    "linux"
    "modules"
    "pages"
    "styles"
    "utils"
)

for folder in "${folders[@]}"
    do
        #echo "📂 - $folder"
        mkdir $folder
        echo "📁 - $folder"
        sleep 0.5
        #clear
    done

clear

# -----------------------------------------------------------------------------------------------------------------------
echo "Creating content in subfolders..."

cd modules
touch app.modules.ts
echo -e '/* @arthur.vsl */

/* 
* This file is an implementation inspired by the way
* Angular organizes the modularization of components in
* its projects
*/

export {
    // itens as newName
} from "your-lib"; ' > app.modules.ts

# ---------------------------------------------------------------------------
cd ../styles
mv global.css styles

# ---------------------------------------------------------------------------
cd ../assets
assetsSubfolders=("fonts" "icons" "images" "videos")
for subFolder in "${assetsSubfolders[@]}"
    do
        mkdir "$subFolder"
    done
    
clear
# -----------------------------------------------------------------------------------------------------------------------

echo "Finish :)"
echo "Arthur Lucena - 2024"
echo "My site: https://arthur-vsl.vercel.app/"
echo "Repository: https://github.com/ArthurViniciusL/improve-next-app"
