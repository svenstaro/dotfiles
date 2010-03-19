#!/bin/bash
ctags -V -R --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f cpp cpp_src
ctags -V --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f boost /usr/include/boost/
ctags -V -R --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f gl /usr/include/GL/
ctags -V -R --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f ogre /usr/include/OGRE/
ctags -V -R --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f ois /usr/include/OIS/
ctags -V -R --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f qt /usr/include/Qt/
ctags -V -R --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f sdl /usr/include/SDL/
ctags -V -R --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f sfml /usr/include/SFML/

