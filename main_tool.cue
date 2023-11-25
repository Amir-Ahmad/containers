package image

import (
	"tool/cli"
	"encoding/json"
)

matrices: {
	// Matrix to build each image, with one step for each platform
	imageBuild: [
		for i in outImages
		for p in i.platforms {
			name:     i.name
			version:  i.version
			platform: p
		},
	]

	// Matrix to merge platform images
	merge: [ for i in outImages {i}]
}

command: matrix: task: print: cli.Print & {
	text: json.Marshal(matrices)
}
