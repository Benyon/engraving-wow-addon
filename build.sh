result=${PWD##*/}
cd ..
rm -rf "C:\Program Files (x86)\World of Warcraft\_retail_\Interface\AddOns\Engrave"
echo "Cleared old addon."
cp -r "./$result" "C:\Program Files (x86)\World of Warcraft\_retail_\Interface\Addons"
echo "Copied addon to Addons folder."
mv "C:\Program Files (x86)\World of Warcraft\_retail_\Interface\Addons\\$result" "C:\Program Files (x86)\World of Warcraft\_retail_\Interface\Addons\Engrave"
rm -rf "C:\Program Files (x86)\World of Warcraft\_retail_\Interface\Addons\Engrave\.git"
rm -rf "C:\Program Files (x86)\World of Warcraft\_retail_\Interface\Addons\Engrave\.gitignore"
rm -rf "C:\Program Files (x86)\World of Warcraft\_retail_\Interface\Addons\Engrave\build.sh"
echo "Cleaned up git, renamed folder and cleared up build steps."