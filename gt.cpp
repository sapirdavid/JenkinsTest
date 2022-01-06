#include <iostream>
//include the google test dependencies
#include <gtest/gtest.h>

TEST(classTest, gt1)
{
  EXPECT_EQ(1,2);
}

int main(int argc, char **argv) {
  testing::InitGoogleTest(&argc, argv);
  return RUN_ALL_TESTS();
}
