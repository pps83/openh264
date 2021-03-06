CODEC_UNITTEST_SRCDIR=test
CODEC_UNITTEST_CPP_SRCS=\
	$(CODEC_UNITTEST_SRCDIR)/./decoder_test.cpp\
	$(CODEC_UNITTEST_SRCDIR)/./encoder_test.cpp\
	$(CODEC_UNITTEST_SRCDIR)/./simple_test.cpp\

CODEC_UNITTEST_OBJS += $(CODEC_UNITTEST_CPP_SRCS:.cpp=.o)
OBJS += $(CODEC_UNITTEST_OBJS)
$(CODEC_UNITTEST_SRCDIR)/%.o: $(CODEC_UNITTEST_SRCDIR)/%.cpp
	$(QUIET_CXX)$(CXX) $(CFLAGS) $(CXXFLAGS) $(INCLUDES) $(CODEC_UNITTEST_CFLAGS) $(CODEC_UNITTEST_INCLUDES) -c $(CXX_O) $<

codec_unittest$(EXEEXT): $(CODEC_UNITTEST_OBJS) $(LIBS) $(CODEC_UNITTEST_LIBS) $(CODEC_UNITTEST_DEPS)
	$(QUIET_CXX)$(CXX) $(CXX_LINK_O) $(CODEC_UNITTEST_OBJS) $(CODEC_UNITTEST_LDFLAGS) $(CODEC_UNITTEST_LIBS) $(LDFLAGS) $(LIBS)

binaries: codec_unittest$(EXEEXT)
BINARIES += codec_unittest$(EXEEXT)
