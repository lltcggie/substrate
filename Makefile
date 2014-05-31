# Cydia Substrate - Powerful Code Insertion Platform
# Copyright (C) 2008-2011  Jay Freeman (saurik)

# GNU Lesser General Public License, Version 3 {{{
#
# Substrate is free software: you can redistribute it and/or modify it under
# the terms of the GNU Lesser General Public License as published by the
# Free Software Foundation, either version 3 of the License, or (at your
# option) any later version.
#
# Substrate is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public
# License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with Substrate.  If not, see <http://www.gnu.org/licenses/>.
# }}}

all: libsubstrate.dylib

LIBVERSION = 0.0.0
CFLAGS = -arch i386 -arch x86_64
CXXFLAGS = -arch i386 -arch x86_64 -std=c++11
INCLUDES = -I./hde64c/include -Iextra
LIBDIRS = 
LIBS = -framework CoreFoundation -framework Foundation

libsubstrate.dylib: Hooker.o DarwinFindSymbol.o ObjectiveC.o Debug.o PosixMemory.o hde64.o
	c++ -compatibility_version $(LIBVERSION) -current_version $(LIBVERSION) -dynamiclib $(CXXFLAGS) $(LIBDIRS) $(LIBS) -o $@ $^

clean:
	rm *.o

hde64.o:
	$(CC) $(CFLAGS) $(INCLUDES) -c hde64c/src/hde64.c

.cpp.o:
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $<

.c.o:
	$(CC) $(CFLAGS) $(INCLUDES) -c $<
