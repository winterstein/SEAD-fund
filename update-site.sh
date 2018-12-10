#!/bin/bash

PROJECT='SEAD-fund'
TARGET='bester.soda.sh'
SSHCOMMAND="ssh winterwell@$TARGET"
TARGETDIR='/home/winterwell/SEAD-fund'
GITSHORTHAND="git --git-dir=$TARGETDIR/.git/ --work-tree=$TARGETDIR"

echo -e "Telling the server to update it's $PROJECT git repo"
echo -e "> Garbage Collecting..."
$SSHCOMMAND "$GITSHORTHAND gc --prune=now"
echo -e "> Pulling Origin..."
$SSHCOMMAND "$GITSHORTHAND pull origin master"
echo -e "> Resetting Files to version held on github"
$SSHCOMMAND "$GITSHORTHAND reset --hard FETCH_HEAD"
echo -e ""

# commented out for speed. uncomment when needed
#echo -e "> Optimising Images..."
#$SSHCOMMAND "optipng $TARGETDIR/webroot/img/*.png"
#$SSHCOMMAND "jpegoptim $TARGETDIR/webroot/img/*.jpg"
#$SSHCOMMAND "jpegoptim $TARGETDIR/webroot/img/*.jpeg"
#echo -e ""

echo -e "> Converting Markdown to HTML..."
printf "\t> Converting Markdown to HTML...\n"
$SSHCOMMAND "wget -cO - 'https://www.winterwell.com/software/downloads/jerbil-all.jar' >> $TARGETDIR/jerbil-all.jar"
$SSHCOMMAND "cd $TARGETDIR && java -cp jerbil-all.jar Jerbil $TARGETDIR"

echo -e "$PROJECT Website has now been updated"
