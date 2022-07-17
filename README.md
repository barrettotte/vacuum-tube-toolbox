# vacuum-tube-toolbox

A work in progress OpenSCAD library (and eventually KiCad designs) to make tinkering with vacuum tubes easier.

## Features

- Tube holders (single/multiple)
- Basic tube sockets
- TODO: 4 pin plugin coil
- TODO: instructions for making a socket saver

## Hardware

### Pins

Vacuum tube pins can be found by searching for "swage mount pins".
This took me forever to find the right google search.

I sourced from:
- https://www.digikey.com/en/products/detail/mill-max-manufacturing-corp/3104-2-00-15-00-00-08-0/436491
- https://www.digikey.com/en/products/detail/mill-max-manufacturing-corp/4395-0-00-15-00-00-08-0/10063634
- https://www.digikey.com/en/products/detail/mill-max-manufacturing-corp/6331-0-00-15-00-00-08-0/10063644
- https://www.mill-max.com/products/new/swage-mount-pcb-pins-for-interconnect-applications
- https://www.mill-max.com/search/tags/swage_mount?src=19

I think that pins can be made by hand by working hollow 2-3mm brass tubing.
This would probably be cheaper and more convenient, but I have not pursued this seriously yet.

## Future Features

- Breakout boards for common tube types (KiCad)
- Breadboard adapters for common tube types (KiCad)
- attempt all basic socket types listed in - https://en.wikipedia.org/wiki/Tube_socket#Summary_of_base_details

## Development Dependencies

- OpenSCAD 2021.01+ - `apt-get -y install openscad`

## References

- https://en.wikipedia.org/wiki/Tube_socket
