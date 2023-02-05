#!/usr/bin/bash
# requires: xmlstarlet

get_gradle_value(){
	grep "$1" "$2" | awk '{ print $2 }' | sed "s/\"//g"
}

out="# NDK Playground\n\n"
for PROJECT in *
do
	manifest="$PROJECT/app/src/main/AndroidManifest.xml"
	if [[ ! -d "$PROJECT"
		|| ! -f "$manifest" 
		|| $(git check-ignore "$PROJECT") ]]; then
		continue
	fi

	stringsxml="$PROJECT/app/src/main/res/values/strings.xml"
	app_name=$(xmlstarlet sel -t -v '//string[@name="app_name"]' "$stringsxml")
	package_name=$(get_gradle_value "namespace" "$PROJECT/app/build.gradle")
	description=$(cat $PROJECT/description.md)
	permissions=$(xmlstarlet sel -t -v "//uses-permission/@android:name" "$manifest")

	out+="## [$app_name]($PROJECT)\n"
	out+="$description\n"
	out+="### Package Name\n\`$package_name\`\n"
	out+="### Permissions\n"
	[[ ! -z "$permissions" ]] && out+="\`\`\`\n${permissions}\n\`\`\`\n\n" || out+="\`NONE\`\n\n"
done

echo -e "$out" > README.md
git add README.md
