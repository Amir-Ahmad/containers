package image

import (
	"strings"
	"list"
)

#platform: "linux/amd64" | "linux/arm64"

#Image: {
	// name should match the directory name in images/
	name: string

	// version of the application
	version: string

	// target platforms to build image for
	platforms: [...#platform] | *["linux/amd64", "linux/arm64"]

	// additional tags to set on image
	// version will be tagged by default
	tags: [...string]
}

image: [X=string]: #Image & {
	name: X
}

input: {
	// filter output images by providing a comma separated list of images
	imagefilter: *"" | =~"^[a-z0-9]+(-[a-z0-9]+)*(,[a-z0-9]+(-[a-z0-9]+)*)*$" @tag(imagefilter)
}

// List of images when filtered by imagefilter
outImages: [string]: #Image

for k, v in image
if input.imagefilter == "" ||
	(input.imagefilter != "" && list.Contains(strings.Split(input.imagefilter, ","), k)) {
	outImages: "\(k)": {
		name:      v.name
		version:   v.version
		platforms: v.platforms
		tags:      v.tags + [v.version]
	}
}
