all: postcode_si

postcode_si:
	go build postcode_si.go

clean:
	rm -rf app
