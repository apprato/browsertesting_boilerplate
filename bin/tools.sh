#!/bin/bash
# description: Tools for end to end frontend testing


# Environment settings
INSTALL_DIR=`echo $0 | sed 's/tools\.sh//g'`
TESTCAFE_BIN=`which testcafe` ;
set -x

testPurchaseSimpleProductAllBrowsers() {
  $TESTCAFE_BIN chrome ../aquila-uat.com.au/tests/purchaseCreditCardMobile.js -e
  $TESTCAFE_BIN chrome ../aquila-uat.com.au/tests/purchaseCreditCardTablet.js -e
  $TESTCAFE_BIN chrome ../aquila-uat.com.au/tests/purchaseCreditCardDesktop.js -e
  $TESTCAFE_BIN firefox ../aquila-uat.com.au/tests/purchaseCreditCardMobile.js -e
  $TESTCAFE_BIN firefox ../aquila-uat.com.au/tests/purchaseCreditCardTablet.js -e
  $TESTCAFE_BIN firefox ../aquila-uat.com.au/tests/purchaseCreditCardDesktop.js -e
  $TESTCAFE_BIN safari ../aquila-uat.com.au/tests/purchaseCreditCardMobile.js -e
  $TESTCAFE_BIN safari ../aquila-uat.com.au/tests/purchaseCreditCardTablet.js -e
  $TESTCAFE_BIN safari ../aquila-uat.com.au/tests/purchaseCreditCardDesktop.js -e  
}

testPurchaseSimpleProductChromeBrowser() {
  $TESTCAFE_BIN chrome ../aquila-uat.com.au/tests/purchaseCreditCardMobile.js -e
  $TESTCAFE_BIN chrome ../aquila-uat.com.au/tests/purchaseCreditCardTablet.js -e
  $TESTCAFE_BIN chrome ../aquila-uat.com.au/tests/purchaseCreditCardDesktop.js -e
}

testPurchaseSimpleProductFirefoxBrowser() {
  $TESTCAFE_BIN firefox ../aquila-uat.com.au/tests/purchaseCreditCardMobile.js -e
  $TESTCAFE_BIN firefox ../aquila-uat.com.au/tests/purchaseCreditCardTablet.js -e
  $TESTCAFE_BIN firefox ../aquila-uat.com.au/tests/purchaseCreditCardDesktop.js -e
}
testPurchaseSimpleProductSafariBrowser() {
  $TESTCAFE_BIN safari ../aquila-uat.com.au/tests/purchaseCreditCardMobile.js -e
  $TESTCAFE_BIN safari ../aquila-uat.com.au/tests/purchaseCreditCardTablet.js -e
  $TESTCAFE_BIN safari ../aquila-uat.com.au/tests/purchaseCreditCardDesktop.js -e  
}

case "$1" in
  testPurchaseSimpleProductAllBrowsers)
    testPurchaseSimpleProductAllBrowsers
    ;;
  testPurchaseSimpleProductChromeBrowser)
    testPurchaseSimpleProductChromeBrowser
    ;;
  testPurchaseSimpleProductFirefoxBrowser)
    testPurchaseSimpleProductFirefoxBrowser
    ;;
  testPurchaseSimpleProductSafariBrowser)
    testPurchaseSimpleProductSafariBrowser
    ;;        
  *)
echo "
SYNOPSIS
    cd bin
    sh tools.sh
    sh tools.sh [-- [OPTIONS...]]

DESCRIPTION
    Docker, docker-compose tools for Magento 1.x, stack


OPTIONS
    testPurchaseSimpleProductAllBrowsers  	            Add Simple Product to Cart and Checkout All Browsers (Mobile, Tablet, Desktop)
    testPurchaseSimpleProductChromeBrowser  	        Add Simple Product to Cart and Checkout All Browsers (Mobile, Tablet, Desktop)
    testPurchaseSimpleProductFirefoxBrowser  	        Add Simple Product to Cart and Checkout All Browsers (Mobile, Tablet, Desktop)
    testPurchaseSimpleProductSafariBrowser  	        Add Simple Product to Cart and Checkout All Browsers (Mobile, Tablet, Desktop)

EXAMPLES
    Please ensure you are in the bin directory
    # cd bin

    Add Simple Product to Cart and Checkout All Browsers (Mobile, Tablet, Desktop)
    # sh tools.sh testPurchaseSimpleProductAllBrowsers

"
    >&2
    exit 1
    ;;
esac