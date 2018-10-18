import { Selector, ClientFunction } from 'testcafe';


fixture`Simple Product`.page`https://www.aquila-uat.com.au`;

// Vars
const regionSelect = Selector("select[name='billing[region_id]']");
const regionOption = regionSelect.find('option');
const shippingRadioButton = Selector("input[value='aquila_shipping_standand']");
const shippingSelectedRadioButton = Selector("input[value='aquila_shipping_standand']");
const expirationDateMonthSelect = Selector("select[name='braintreecw_creditcard[expiration_date_month]']");
const expirationDateMonthOption = expirationDateMonthSelect.find('option');
const expirationDateYearSelect = Selector("select[name='braintreecw_creditcard[expiration_date_year]']");
const expirationDateYearOption = expirationDateYearSelect.find('option');

// Silently log errors without aborting test
const handleWarnings = ClientFunction(() => {
        console.warn = msg => { throw new Error(msg) };
});

// Functions
const setCookie = ClientFunction(() => {
        document.cookie = "aquila_newsletter=1"
});

const getCookie = ClientFunction(() => {
        return document.cookie;
});


test('Add Simple Product to Cart, Checkout as Guest and Purchase through Onestep Checkout', async t => {
        await t

                .resizeWindow(750, 800)

        // Add simple product to cart
        await setCookie();
        await t.wait(6000);
        await t.click('#aquila-signup .remove_newsletter');
        await t.navigateTo('https://www.aquila-uat.com.au/gifting/gifting-accessories/aquila-black-shoe-cream.html');
        //console.log(await getCookie());
        await t.wait(1000)
                .click('button.icon-sbag')
                .wait(2000)

                // Login as guest
                .navigateTo('https://www.aquila-uat.com.au/checkoutlogin/')
                .wait(1000)
                .typeText('input.guest-checkoutlogin-text', 'stephen@aquila.com.au')
                .click('button.guest-checkoutlogin')

                // Checkout page
                .typeText("input[name='billing[firstname]']", 'Stephen')
                .typeText("input[name='billing[lastname]']", 'Goudie')
                .typeText("input[name='billing[company]']", 'Aquila')
                .typeText("input[name='billing[street][0]']", '204 Gipps St')
                .typeText("input[name='billing[city]']", 'Abbotsford')
                .click(regionSelect)
                .click(regionOption.filter('[value="491"]'))
                .expect(regionSelect.value).eql('491')
                .typeText("input[name='billing[email]']", 'stephen@aquila.com.au')
                .typeText("input[name='billing[telephone]']", '(03) 9415 1424')
                .click(shippingRadioButton)
                .click('#p_method_braintreecw_creditcard')
                .typeText("input[name='braintreecw_creditcard[cardholder_name]']", 'stephen goudie')
                .typeText("input[placeholder='CREDIT CARD NUMBER']", '4111111111111111')
                .typeText("input[name='braintreecw_creditcard[cvc]']", '123')
                .click(expirationDateMonthSelect)
                .click(expirationDateMonthOption.filter('[value="01"]'))
                .click(expirationDateYearSelect)
                .click(expirationDateYearOption.filter('[value="2027"]'))
                .click('.onestepcheckout-place-order')
                .wait(5000)
});
