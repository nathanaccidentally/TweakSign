# This is a template for checking the signature to the system.

# Welcome to TweakSign, a new way to sign tweaks and verify their security. Built by nathanaccidentally.
# Written in 2016/2017 by Nathan Goodwin and licensed under the MIT licinse.
# It is not required to include credit for any use or redistribution of this project.

    checkForFile="DEBIAN/fileToCheck"
    if [ -f "$checkForFile" ]
    then

    fileMD5LineTitle="File MD5: "
    filemd5FromSig=$(grep "$fileMD5LineTitle" DEBIAN/signature)
    currentFileMd5FromSystem=$(md5 DEBIAN/file)
    grep "$fileMD5LineTitle" DEBIAN/signature

    # This is the actual check for the file:
    
    if [[ "$filemd5FromSig" =~ "$currentFileMd5FromSystem" ]]; then
    	echo "Valid File MD5..."
    else
    	echo "⚠️ Invalid File MD5.⚠️ "
    	exit
    fi


    fileSHA1LineTitle="File SHA1: "
    fileSHA1FromSig=$(grep "$fileSHA1LineTitle" DEBIAN/signature)
    currentFileSHA1FromSystem=$(openssl sha1 DEBIAN/file)
    grep "$fileSHA1LineTitle" DEBIAN/signature
    
    if [[ "$fileSHA1FromSig" =~ "$currentFileSHA1FromSystem" ]]; then
    	echo "Valid File SHA1..."
    else
    	echo "⚠️ Invalid File SHA1.⚠️ "
    	exit
    fi
else
	echo "File script not found."
fi
