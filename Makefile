test:           ; bash scripts/test.sh
sast:           ; bash scripts/scan_sast.sh
secrets:        ; bash scripts/scan_secrets.sh
build:          ; bash scripts/build.sh
img-scan:       ; bash scripts/scan_image.sh
iac-scan:       ; bash scripts/scan_iac.sh
deploy:         ; bash scripts/deploy.sh
dast:           ; bash scripts/scan_dast.sh

all: test sast secrets build img-scan iac-scan
